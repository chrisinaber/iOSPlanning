//
//  DBAccess.m
//  Bible365
//
//  Created by Chris Price on 12/06/2010.
//  Copyright 2010 UW Aberystwyth. All rights reserved.
//

#import "DBObjC.h"

@implementation DBObjC

sqlite3_stmt *statement;


+ (id) sharedInstance {
    static DBObjC *instance = nil;
    
    if( ! instance ) { // if it doesn't exist, we'll create it, otherwise just return it
        instance = [[[self class] alloc] init];
        
        //Load the database
        [instance databaseStartup];
    }
    return instance; 
}

-(void) databaseStartup{
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"bibleDB.sqlite3"];
    
    int result = sqlite3_open_v2([defaultDBPath UTF8String], &mySQLDB, SQLITE_OPEN_READONLY, NULL);
    
    if (result != SQLITE_OK){
        sqlite3_close(mySQLDB);
        NSAssert(0, @"Failed to open database");
    }
}


-(BOOL) statementPrepared: ( NSString *) query{
    // Set up the query so we get a set of records back
    return (sqlite3_prepare_v2( mySQLDB, [query UTF8String], -1, &statement, nil ) == SQLITE_OK);
}

-(BOOL) anotherRowInDB {
    // get the next record so we we can access its fields below - false means no more records
    return (sqlite3_step(statement) == SQLITE_ROW);
}

-(NSString *) stringAtField: (int) index{
    // return the indexed field (first field is zero) as a string
    char *itemChar = (char *) sqlite3_column_text(statement, index);
    NSString *result = [[NSString alloc] initWithUTF8String: itemChar];
    return result;
}

-(NSInteger) intAtField: (int) index{
    // return the indexed field (first field is zero) as an integer
    NSInteger result = sqlite3_column_int(statement, index);;
    return result;
}

-(void) sqlFinishStatement{
    // Call this at the end of accessing a set of records to finish the query
    sqlite3_finalize(statement);
}

-(void) databaseClose{
    // Close the DB at the end
	sqlite3_close(mySQLDB);		
}
	
	
@end
