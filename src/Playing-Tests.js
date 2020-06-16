define(["amber/boot", "require", "amber/core/SUnit"], function($boot,requirejs){"use strict";
var $core=$boot.api,nil=$boot.nilAsValue,$nil=$boot.nilAsReceiver,$recv=$boot.asReceiver,$globals=$boot.globals;
var $pkg = $core.addPackage("Playing-Tests");
$pkg.transport = {"type":"amd","amdNamespace":"amber-test"};

$core.addClass("PlayingTest", $globals.TestCase, "Playing-Tests");
$core.addMethod(
$core.method({
selector: "testShowMessage",
protocol: "as yet unclassified",
//>>excludeStart("ide", pragmas.excludeIdeData);
args: [],
source: "testShowMessage\x0a\x09| playing |\x0a\x09playing := Playing new.\x0a\x09playing showMessage: 'Hello from test'.",
referencedClasses: ["Playing"],
//>>excludeEnd("ide");
pragmas: [],
messageSends: ["new", "showMessage:"]
}, function ($methodClass){ return function (){
var self=this,$self=this;
var playing;
//>>excludeStart("ctx", pragmas.excludeDebugContexts);
return $core.withContext(function($ctx1) {
//>>excludeEnd("ctx");
playing=$recv($globals.Playing)._new();
$recv(playing)._showMessage_("Hello from test");
return self;
//>>excludeStart("ctx", pragmas.excludeDebugContexts);
}, function($ctx1) {$ctx1.fill(self,"testShowMessage",{playing:playing})});
//>>excludeEnd("ctx");
}; }),
$globals.PlayingTest);


});
