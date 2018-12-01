function __ess_TabCPanel(tabs, sIndex, id) {
    this.id = id;

    var t;
    for (var i = 0; i < tabs.length; i++) {
        t = new __ess_CTab(tabs[i], this);
        if (i == sIndex) {
            this.current = t;
            ess.dom.attachEvent(document, "onload", ess.createDelegate(this, function(){ess.setVar(this.id, this.current.header.id)}));
        }
    }
}

function __ess_CTab(tab, parent) {
    this.header = ess.dom.getById(tab.header);
    this.content = ess.dom.getById(tab.content);
    this.parent = parent;
    this.init();
}

__ess_CTab.prototype =
{
    init: function() {
        ess.dom.attachEvent(this.header, "onclick", ess.createDelegate(this, this.onClick));
    },

    onClick: function() {
        this.parent.current.header.className = 'tabPaneContainerNormal';
        this.parent.current.content.className = 'tabPaneContent Hidden';

        this.header.className = 'tabPaneContainerActive';
        this.content.className = 'tabPaneContent';

        this.parent.current = this;
        ess.setVar(this.parent.id, this.header.id);
    }
}