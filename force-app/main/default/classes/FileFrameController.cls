public class FileFrameController {
  @AuraEnabled(cacheable=true)
  public static String getFileURL(Id recordId, String startWith, String contains) {
    
    String linkQueryString = generateLinkQueryString(recordId, startWith, contains);
    ContentDocumentLink link = Database.query(linkQueryString);
    ContentVersion version = [
      SELECT Id, FileType 
      FROM ContentVersion 
      WHERE ContentDocumentId = :link.ContentDocumentId 
      ORDER BY CreatedDate DESC LIMIT 1
    ];

    String rendition = version.FileType=='PDF' ? 'SVGZ' : 'ORIGINAL_Png';
    String fileURL = '/sfc/servlet.shepherd/version/renditionDownload?rendition=' + rendition + '&versionId=' + version.Id + '&operationContext=CHATTER&contentId=' + link.ContentDocumentId;
    return fileURL;
  }
  @TestVisible
  private static String generateLinkQueryString(Id recordId, String startWith, String contains) {
    String queryString = 'SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = \'' + String.escapeSingleQuotes(recordId) + '\'';

    if(startWith != null && startWith != '') {
      queryString += ' AND ContentDocument.Title LIKE \'' + String.escapeSingleQuotes(startWith) + '%\'';
    }

    if(contains != null && contains != '') {
      queryString += ' AND ContentDocument.Title LIKE \'%' + String.escapeSingleQuotes(contains) + '%\'';
    }

    queryString += ' ORDER BY ContentDocument.ContentModifiedDate DESC LIMIT 1';
    return queryString;
  }
}
