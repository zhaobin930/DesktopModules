StyleToolbar = Class.create();

StyleToolbar.prototype = {
    initialize:function(oTitleStyleContainer,oTitleSrc,oToolbarContainer,oToolbarImage)
    {       
        for(var p in StyleToolbar.prototype)
        {
            eval('this.'+p+'=this.'+p+'.bind(this);');
        }  
        this.vTitleStyleContainer = oTitleStyleContainer;
        this.vTitleElement = null;
        this.vTitleSrc = oTitleSrc;
        this.tblToolbarContainer = oToolbarContainer;
        this.tblToolbarContainer.className = "styletoolbar";
        this.imgToolbar = oToolbarImage;
    },    
    initToolbar:function()
    {
	    var nToolbarWidth = parseInt(this.imgToolbar.width);
	    var nButtonNum = parseInt(this.imgToolbar.toolnum);
	    var rowToolbar = document.createElement("tr");
	    for(i=0;i<nButtonNum;i++)
	    {
	        var tdButton = document.createElement("td");
	        tdButton.id = "tool" + i;
	        tdButton.width = nToolbarWidth/nButtonNum;
	        tdButton.height = this.imgToolbar.height;
	        tdButton.background=this.imgToolbar.src;
	        tdButton.style.backgroundPositionX =  0 - i * tdButton.width;
	        tdButton.className = "tdButtonNoSel";
	        tdButton.onmouseover = this.toolMoveoverStyle;
	        tdButton.onmouseout = this.toolMoveoutStyle;
	        tdButton.innerHTML = "&nbsp;";
	        tdButton.onclick = this.toolEvent;
	        rowToolbar.appendChild(tdButton);
	    }
	    var vTbody = document.createElement("TBODY");
	    vTbody.appendChild(rowToolbar);
	    this.tblToolbarContainer.appendChild(vTbody);
	    document.body.attachEvent("onclick",this.handleBodyClick);
	    this.vTitleContainerCleanSource = this.vTitleStyleContainer.innerHTML;
	    this.vTitleSrc.onchange = this.showTitleStyle;
	    if(this.vTitleSrc.value == "")
	    {
	        this.setTitleContainer(this.vTitleContainerCleanSource);
	    }
	    else
	    {
	       this.setTitleContainer(this.vTitleSrc.value);
	    }
    },
    toolMoveoverStyle:function()
    {
        var oElement = event.srcElement;
        this.setCurrentToolNormal();
        oElement.className = "tdButtonSel";
        if(this.toolPressDown)
        {
            oElement.click();
        }
    },
    toolMoveoutStyle:function()
    {
        var oElement = event.srcElement;
        if(oElement == this.currentTool)
        {
            var currentToolFuncPane = this.getToolFuncPane(this.currentTool.id);
            if(currentToolFuncPane && currentToolFuncPane.style.display == "block") return;        
        }
        oElement.className = "tdButtonNoSel";
    },
    setCurrentToolNormal:function()
    {
        if(this.currentTool)
        {
            this.currentTool.className = "tdButtonNoSel";
            var currentToolFuncPane = this.getToolFuncPane(this.currentTool.id);
            if(currentToolFuncPane) currentToolFuncPane.style.display = "none";
            this.currentTool = null;
        }
        if(this.currentMenuItem)
        {
            this.currentMenuItem.className = "stylemenuitem";
            this.currentMenuItem = null;
        }
        
    },
    handleBodyClick:function()
    {
        this.setCurrentToolNormal();
        this.toolPressDown =false;
    },
    toolEvent:function()
    {
        this.toolPressDown = true;
        this.currentTool = event.srcElement;
        eval("this." + this.currentTool.id + "func()");
        event.cancelBubble = true;
    },
    tool0func:function()
    {
        var toolId = "tool0";
        var toolPane = this.getToolFuncPane(toolId);
        if(toolPane == null)
        {
            toolPane = this.createTool0FuncPane(toolId);
            document.body.appendChild(toolPane);    
        }
        var pos = StyleToolbar.getAbsPosition(this.currentTool);
        toolPane.style.left = pos.x;
        toolPane.style.top = parseInt(pos.y) + parseInt(this.currentTool.scrollHeight) + 3;
        toolPane.style.display = "block";    
    },
    createTool0FuncPane:function(toolId)
    {
        var toolPane = this.createToolFuncPane(toolId);
        
        var toolMenuItem = this.createMenuItem("<B>粗体</B>");
        toolMenuItem.funcexp = 'this.applyStyle("fontWeight","bold");';
        toolPane.appendChild(toolMenuItem);
        
        toolMenuItem = this.createMenuItem("<I>斜体</I>");
        toolMenuItem.funcexp = 'this.applyStyle("fontStyle","italic");';
        toolPane.appendChild(toolMenuItem);
        
        toolMenuItem = this.createMenuItem("<U>下划线</U>");
        toolMenuItem.funcexp = 'this.applyStyle("textDecoration","underline");';
        toolPane.appendChild(toolMenuItem);
        
        toolMenuItem = this.createMenuItem("清除格式");
        toolMenuItem.funcexp = 'this.setTitleContainer(this.vTitleContainerCleanSource);';
        toolPane.appendChild(toolMenuItem);
        
        return toolPane;
    },
    tool1func:function()
    {
        var toolId = "tool1";
        var toolPane = this.getToolFuncPane(toolId);
        if(toolPane == null)
        {
            toolPane = this.createTool1FuncPane(toolId);
            document.body.appendChild(toolPane);    
        }
        var pos = StyleToolbar.getAbsPosition(this.currentTool);
        toolPane.style.left = pos.x;
        toolPane.style.top = parseInt(pos.y) + parseInt(this.currentTool.scrollHeight) + 3;
        toolPane.style.display = "block";    
    },
    createTool1FuncPane:function(toolId)
    {
        var toolPane = this.createToolFuncPane(toolId);
        for(vSize = 10;vSize < 22; vSize +=2)
        {
        eval(' var toolMenuItem = this.createMenuItem("<span style=font-size:'+ vSize +'px>'+vSize+'象素</span>");'+
        'toolMenuItem.funcexp = \'this.applyStyle("fontSize","'+vSize+'px");\';'+
        'toolPane.appendChild(toolMenuItem);');
        }
                
        return toolPane;
    },
    tool2func:function()
    {
        var toolId = "tool2";
        var toolPane = this.getToolFuncPane(toolId);
        if(toolPane == null)
        {
            toolPane = this.createTool2FuncPane(toolId);
            document.body.appendChild(toolPane);    
        }
        var pos = StyleToolbar.getAbsPosition(this.currentTool);
        toolPane.style.left = pos.x;
        toolPane.style.top = parseInt(pos.y) + parseInt(this.currentTool.scrollHeight) + 3;
        toolPane.style.display = "block";    
    },
    createTool2FuncPane:function(toolId)
    {
        var toolPane = this.createToolFuncPane(toolId);
        var vNamedColor = 'Red,Green,Blue,Yellow,Black,White,Maroon,Olive,Navy,Purple,Gray,Lime,Aqua,Fuchsia,Silver,Teal';
        var vNamedColorArray = vNamedColor.split(",");
        for(vIdx = 0;vIdx < vNamedColorArray.length; vIdx++)
        {
            var vColor = vNamedColorArray[vIdx];
        eval(' var toolMenuItem = this.createMenuItem("<span style=color:'+ vColor +'>'+vColor+'</span>");'+
        'toolMenuItem.funcexp = \'this.applyStyle("color","'+vColor+'");\';'+
        'toolPane.appendChild(toolMenuItem);');
        }
                
        return toolPane;
    },
    getToolFuncPane:function(toolId)
    {
        var divTool = document.getElementById(toolId + "-div");
        return divTool;
    },
    createToolFuncPane:function(toolId)
    {
        var divTool = document.createElement("DIV");
        divTool.id = toolId + "-div";
        divTool.className = "styletoolPane";
        return divTool;
    },
    createMenuItem:function(menuitemText)
    {
        var toolMenuItem = document.createElement("DIV");
        toolMenuItem.className = "stylemenuitem";
        toolMenuItem.itemtype = "stylemenuitem";
        toolMenuItem.innerHTML = menuitemText;
        toolMenuItem.onmouseover = this.changeMemuItemStyle;
        toolMenuItem.onclick = this.handleMenuItemClick;
        return toolMenuItem;
    },
    handleMenuItemClick:function()
    {
        var vEventMenuItem = StyleToolbar.getMenuItem(event.srcElement);
        if(vEventMenuItem.funcexp) eval(vEventMenuItem.funcexp);
    },
    setTitleContainer:function(titleInnerSrc)
    {
        if(titleInnerSrc == "") titleInnerSrc = this.vTitleContainerCleanSource;
        this.vTitleStyleContainer.innerHTML = titleInnerSrc;
        this.vTitleElement = null;
        for(i=0;i<this.vTitleStyleContainer.childNodes.length;i++)
        {
            var ele = this.vTitleStyleContainer.childNodes[i];
            if(ele.innerHTML == "[TITLE]") this.vTitleElement = ele;
        }
        if(this.vTitleElement == null)
        {
            this.vTitleStyleContainer.innerHTML = this.vTitleStyleContainer.innerHTML.replace("[TITLE]","<span id=titlestylespan>[TITLE]</span>");            
            this.vTitleElement = document.getElementById("titlestylespan");
        }
        if(titleInnerSrc == this.vTitleContainerCleanSource) this.vTitleSrc.value = "";
        this.vTitleElement.attachEvent("onpropertychange",this.showTitleStyleSrc);
    },
    showTitleStyleSrc:function()
    {	
        this.vTitleSrc.value = this.vTitleStyleContainer.innerHTML;
    },
    showTitleStyle:function()
    {
        this.setTitleContainer(this.vTitleSrc.value);
    },
    applyStyle:function(styleName,styleValue)
    {   
        this.vTitleElement.style.setAttribute(styleName,styleValue);
    },
    changeMemuItemStyle:function()
    {
        if(this.currentMenuItem) this.currentMenuItem.className = "stylemenuitem";
        var vMenuItem = StyleToolbar.getMenuItem(event.srcElement);
        vMenuItem.className = "stylemenuitemhover";
        this.currentMenuItem = vMenuItem;
    }
}
StyleToolbar.getMenuItem = function(elementNode)
{
    if(elementNode.itemtype && elementNode.itemtype == "stylemenuitem") return elementNode;
    else if(elementNode.parentElement) return StyleToolbar.getMenuItem(elementNode.parentElement);
    return null;
}
StyleToolbar.getAbsPosition = function(obj)  
{  
  var abs={x:0,y:0};
  while(obj && obj!=document.body){  
  abs.x+=obj.offsetLeft;  
  abs.y+=obj.offsetTop;  
  obj=obj.offsetParent;  
  }  
  return abs;  
}