/* Accordion Script
 * Requires Prototype and Script.aculo.us Libraries
 */

if (typeof Effect == 'undefined')
  throw("You must have the script.aculo.us library to use this accordion");

var Accordion = Class.create({
    initialize: function(menuId,options) {
      this.options = Object.extend({
        subMenuType: 'ul',
        subMenuTrigger: 'li',
        propagate: true,
        replaceLink: false,
        firstRun: true,
        triggerType: 'click'
      }, options);
      this.initSubMenu($(menuId),this.options.firstRun);
    },
    setTrigger: function(trigger,content){
      content.hide();
      trigger.observe('click',function(ev){
        var element = ev.element();
        if(!element.match('a')){
          //alert(navigator.appVersion.indexOf("MSIE 7."))
          if(navigator.appVersion.indexOf("MSIE 7.") == -1){
            new Effect.toggle(content,'blind',{
              duration: .2,
              onComplete: function(){trigger.toggleClassName('selected');}
            });
          }else{
            content.toggle();
          }
        }
      })
      content.observe(this.options.triggerType,function(ev){ev.stopPropagation();})
    },
    initSubMenu: function(list,initCall){
      list.childElements(this.options.subMenuTrigger).each(function(trigger,index){
        var firstLink = trigger.down('a');
        if(firstLink && this.options.replaceLink == true){
          firstLink.remove();
          var newLink = new Element('a',{href: firstLink.href, 'class': 'quiet'}).update('[view]');
          newLink.observe('click',function(){document.location=this.href});
          trigger.insert({'top': newLink});
          trigger.insert({'top': firstLink.innerHTML})
        }
        var content = trigger.down(this.options.subMenuType);
        if(content){
          trigger.addClassName('parent');
          this.setTrigger(trigger,content);
          this.initSubMenu(trigger.down(this.options.subMenuType));
          if(index == 0 && initCall == true){
            trigger.down(this.options.subMenuType).show();
            trigger.toggleClassName('selected');
          }
        }
      }.bind(this));
    }
});
