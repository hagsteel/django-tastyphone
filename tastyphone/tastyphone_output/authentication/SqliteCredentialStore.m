//
//  
//
//  Created by tastyphone on 22/8/2012.
//

#import "SqliteCredentialStore.h"
#import <sqlite3.h>

@interface SqliteCredentialStore (Private)
- (NSString *)getDatabasePath;
- (void)createTableIfMissing;
@end

@implementation SqliteCredentialStore

static NSString* databaseName = @"credentials.sqlite";


- (id)init {
	self = [super init];
	if (self) {
		BOOL success;
		NSFileManager *fileManager = [NSFileManager defaultManager];
		success = [fileManager fileExistsAtPath:[self getDatabasePath]];
		
		if (!success)
		{
			NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
			[fileManager copyItemAtPath:databasePathFromApp toPath:[self getDatabasePath] error:nil];
		}
		
		[self createTableIfMissing];
	}
	return self;
}

#pragma mark - Credential Storage Protocol

- (void)saveCredentials:(NSDictionary*)credentials {
	sqlite3 *database;
	sqlite3_open([[self getDatabasePath] UTF8String], &database);
	
	NSString *st = [NSString stringWithFormat:@"INSERT INTO credentials (key, value) VALUES (\"%@\", \"%@\")",
					[credentials objectForKey:@"key"],
					[credentials objectForKey:@"value"]];
	
	sqlite3_exec(database, [st UTF8String], NULL, NULL, NULL);
	sqlite3_close(database);	
}

- (NSDictionary*)getCredentials {
	NSMutableDictionary *credentials = [[[NSMutableDictionary alloc] init] autorelease];
	
	sqlite3 *database;
	sqlite3_open([[self getDatabasePath] UTF8String], &database);
	
	NSString *statement = @"SELECT * FROM credentials";
	sqlite3_stmt *selectStatement;
	sqlite3_prepare_v2(database, [statement UTF8String], -1, &selectStatement, nil);
	
	while (sqlite3_step(selectStatement) == SQLITE_ROW)
	{
		[credentials setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)] forKey:@"key"];
		[credentials setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)] forKey:@"value"];
	}
	
	sqlite3_close(database);
	
	return [NSDictionary dictionaryWithDictionary:credentials];
}

- (void)removeCredentials {
	sqlite3 *database;
	sqlite3_open([[self getDatabasePath] UTF8String], &database);
	sqlite3_exec(database, "drop TABLE credentials", NULL, NULL, NULL);
	sqlite3_close(database);
}

#pragma mark - data access methods

- (NSString *)getDatabasePath {
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	return [NSString stringWithString:[documentsDir stringByAppendingPathComponent:databaseName]];
}

- (void)createTableIfMissing {
	sqlite3 *database;
	sqlite3_open([[self getDatabasePath] UTF8String], &database);
	sqlite3_exec(database, "CREATE TABLE credentials (credentialId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, key text NOT NULL, value text NOT NULL)", NULL, NULL, NULL);
	sqlite3_close(database);
}


@end
