* install plant uml on mac
  * brew install graphviz
  * brew install plantuml 
* generate svg image from plantuml diagram
  *  plantuml -tsvg \<Markdown document contain plantuml code\>
  
```plantuml
@startuml boot_up
Alice -> Bob: Hello
Bob -> Alice: Hi!
		
@enduml
```


<!-- ![](firstDiagram.svg) -->