import
  macros, jsconsole, jsffi
  litz, # internal
  ast_pattern_matching, # 3rdparty
  custom_element/ce_class

type
  CustomElementOptions* = ref object of JsObject
  extends*: cstring

  CustomElementRegistry {.importc.} = ref object of JsObject

var 
  customElements* {.nodecl, importc.}: CustomElementRegistry

proc define*(cer: CustomElementRegistry, n: cstring, c: JsObject, o: CustomElementOptions = nil) {.importcpp: "#.define(@)".}
