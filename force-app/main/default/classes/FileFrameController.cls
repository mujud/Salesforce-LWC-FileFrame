public class FileFrameController {
  @AuraEnabled(cacheable=true)
  public static String getFileURL(Id recordId) {
    ContentDocumentLink link = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId ORDER BY ContentDocument.ContentModifiedDate DESC LIMIT 1];
    ContentVersion version = [SELECT Id,FileType FROM ContentVersion WHERE ContentDocumentId = :link.ContentDocumentId ORDER BY CreatedDate DESC LIMIT 1];
    String rendition = version.FileType=='PDF'?'SVGZ':'ORIGINAL_Png';
    String fileURL = '/sfc/servlet.shepherd/version/renditionDownload?rendition='+rendition+'&versionId=' + version.Id + '&operationContext=CHATTER&contentId=' + link.ContentDocumentId;
    return fileURL;
  }
}