//
//  DBObjC.h
//  Bible365
//
//  Created by Chris Price on 12/06/2010.
//  Copyright 2010 UW Aberystwyth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBObjC : NSObject {

	sqlite3 *mySQLDB;
}

+ (id) sharedInstance;

-(void) databaseStartup;
-(void) databaseClose;

-(BOOL) statementPrepared: ( NSString *) query;
-(BOOL) anotherRowInDB;
-(NSString *) stringAtField: (int) index;
-(NSInteger) intAtField: (int) index;
-(void) sqlFinishStatement;


@end
