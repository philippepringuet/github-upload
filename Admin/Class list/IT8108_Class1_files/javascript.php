M.core_user={};M.core_user.init_participation=function(Y){Y.on('change',function(){var action=Y.one('#formactionid');if(action.get('value')==''){return}
var ok=!1;Y.all('input.usercheckbox').each(function(){if(this.get('checked')){ok=!0}});if(!ok){return}
Y.one('#participantsform').submit()},'#formactionid');Y.on('click',function(e){var showallink=this.getAttribute('data-showallink');if(showallink){window.location=showallink}
Y.all('input.usercheckbox').each(function(){this.set('checked','checked')})},'#checkall, #checkallonpage');Y.on('click',function(e){Y.all('input.usercheckbox').each(function(){this.set('checked','')})},'#checknone')};M.core_user.init_tree=function(Y,expand_all,htmlid){Y.use('yui2-treeview',function(Y){var tree=new Y.YUI2.widget.TreeView(htmlid);tree.subscribe("clickEvent",function(node,event){return!1});if(expand_all){tree.expandAll()}
tree.render()})}