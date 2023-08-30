@isTest
public class FileFrameControllerTest {
    @isTest
    static void testGetFileURL() {
        Account testAccount = new Account(Name='Test Account');
        insert testAccount;

        ContentVersion contentVersion = new ContentVersion(
            Title = 'TestPDF',
            PathOnClient = 'TestPDF.pdf',
            VersionData = Blob.valueOf('Test Content'),
            IsMajorVersion = true
        );
        insert contentVersion;

        Id contentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :contentVersion.Id LIMIT 1].ContentDocumentId;
        ContentDocumentLink link = new ContentDocumentLink(
            ContentDocumentId = contentDocumentId,
            LinkedEntityId = testAccount.Id,
            ShareType = 'V'
        );
        insert link;

        Test.startTest();
        String resultURL = FileFrameController.getFileURL(testAccount.Id, 'Test', null);
        Test.stopTest();

        System.assert(resultURL.contains('/sfc/servlet.shepherd/version/renditionDownload'), 'URL should contain base shepherd URL');
        System.assert(resultURL.contains('operationContext=CHATTER'), 'URL should contain operationContext=CHATTER');
    }
    @isTest
    static void testGenerateLinkQueryString() {
        String queryResult = FileFrameController.generateLinkQueryString('0012b00000OoWXYAA3', 'Test', 'PDF');

        System.assert(queryResult.contains('FROM ContentDocumentLink WHERE LinkedEntityId'), 'Query should target ContentDocumentLink');
        System.assert(queryResult.contains('AND ContentDocument.Title LIKE \'Test%\''), 'Query should filter by startWith');
        System.assert(queryResult.contains('AND ContentDocument.Title LIKE \'%PDF%\''), 'Query should filter by contains');
    }
}
