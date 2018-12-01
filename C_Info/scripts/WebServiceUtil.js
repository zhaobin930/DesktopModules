
var innerXmlHttp = null;
var innerHandleStateChange = null;
var innerParam = null;

function xmlSend(strURL, callBack, param)
{
	if(window.ActiveXObject){
		try
		{
			innerXmlHttp = new ActiveXObject('Msxml2.XMLHTTP');			
		}
		catch (ex)
		{
			innerXmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
		}
	}
	else
	{
		innerXmlHttp =  new XMLHttpRequest();
	}

	var bAysync = false;

	if (callBack)
	{
		bAysync = true;
		innerXmlHttp.onreadystatechange = handleStateChange;
		innerParam = param;
		innerHandleStateChange = callBack;
	}

	innerXmlHttp.open("GET", strURL, bAysync);
	innerXmlHttp.setRequestHeader ("Content-Type","text/xml; charset=utf-8");
	innerXmlHttp.send(null);
	if (bAysync)
		return innerXmlHttp;
	else
	{
		return innerXmlHttp.responseText;
	}
}

function handleStateChange()
{
	if (innerXmlHttp.readyState == 4)
	{
		if (innerHandleStateChange)
			innerHandleStateChange(innerXmlHttp, innerParam);

		innerHandleStateChange = null;
	}
}

function addArticleHits(vBaseAddress,vId){
	var sUrl = vBaseAddress + "/AddArticleHits?ArticleID=" + vId;
	xmlSend(sUrl,null,null);
}

function getArticleHits(srcService,vBaseAddress,vId){
	var sUrl = vBaseAddress + "/GetArticleHits?ArticleID=" + vId;
	xmlSend(sUrl,callback,srcService);
}

function addAndGetArticleHits(srcService,vBaseAddress,vId){
	var sUrl = vBaseAddress + "/AddAndGetArticleHits?ArticleID=" + vId;
	xmlSend(sUrl,callback,srcService);
}

function callback(res,vEle){
	var serviceEle = document.getElementById(vEle);
    if (res.status == 200)    
        serviceEle.innerHTML = res.responseXML.documentElement.firstChild.nodeValue;
    else
        serviceEle.innerText='66';
}
var arrSrcEle = new Array();
var arrId = new Array();
function flushHitArray(vBaseAddress){
	var strIds = '';
	for(i = 0;i<arrId.length;i++)
	{
		if(strIds != '') strIds += ',';
		strIds += arrId[i];
	}
	if(strIds != '')
	{
		var sUrl = vBaseAddress + "/GetArticleHitsArray?ArticleIDs=" + strIds;
		xmlSend(sUrl,callbackArray);		
	}
}
function addFetchHitsArray(srcService,vId){
	arrSrcEle[arrSrcEle.length] = srcService;
	arrId[arrId.length] = vId;
}
function callbackArray(res){
	if (res.status != 200) return;
   var typeListNodes = res.responseXML.documentElement.selectNodes("/NewDataSet/Table");
   for(i=0;i<typeListNodes.length;i++)
   {	
		infoid = typeListNodes[i].selectSingleNode("InfoID").firstChild.nodeValue;
		hits = typeListNodes[i].selectSingleNode("Hits").firstChild.nodeValue;
		for(j = 0;j<arrId.length;j++)
		{
			if(arrId[j] == infoid){
				document.getElementById(arrSrcEle[j]).innerHTML = hits;
				break;
			}
		}
	}
}
if( document.implementation.hasFeature("XPath", "3.0") )
{
   // prototying the XMLDocument
   XMLDocument.prototype.selectNodes = function(cXPathString, xNode)
   {
      if( !xNode ) { xNode = this; }
      var oNSResolver = this.createNSResolver(this.documentElement)
      var aItems = this.evaluate(cXPathString, xNode, oNSResolver,
                   XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null)
      var aResult = [];
      for( var i = 0; i < aItems.snapshotLength; i++)
      {
         aResult[i] =  aItems.snapshotItem(i);
      }
      return aResult;
   }
   // prototying the Element
   Element.prototype.selectNodes = function(cXPathString)
   {
      if(this.ownerDocument.selectNodes)
      {
         return this.ownerDocument.selectNodes(cXPathString, this);
      }
      else{throw "For XML Elements Only";}
   }
   XMLDocument.prototype.selectSingleNode = function(cXPathString, xNode)
    {
	  if( !xNode ) { xNode = this; } 
	  var xItems = this.selectNodes(cXPathString, xNode);
	  if( xItems.length > 0 )
	  {
		 return xItems[0];
	  }
	  else
	  {
		 return null;
	  }
   }
   Element.prototype.selectSingleNode = function(cXPathString)
   {    
	  if(this.ownerDocument.selectSingleNode)
	  {
		 return this.ownerDocument.selectSingleNode(cXPathString, this);
	  }
	  else {throw "For XML Elements Only";}
   }
}
