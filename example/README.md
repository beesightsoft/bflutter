# bflutter_poc

BeeSight Soft Flutter Core Proof of concept


## Integrate bflutter in dev mode

- Clone bflutter and place it in the same folder root with bflutter_poc
https://github.com/beesightsoft/bflutter

- Check dependencies pubspec.yaml of bflutter_poc
```
dependencies:
  ...
  bflutter:
    path: ../
```

## Structure

```
                                                     
     main.dart                                       
         |                                           
 +-------|------+                                    
 |     home     |                                    
 +--------------+                                    
 - Show repo info                                    
 - Navigate to search screen                         
         |                                           
         |                                           
 +-------|------+                                    
 |    search    |                                    
 +--------------+                                    
 - Search github user                                
 - Show a list of user                               
 - Tap on specific user and navigate to detail screen
         |                                           
         |                                           
 +-------|------+                                    
 |    detail    |                                    
 +--------------+                                    
 - Show detail of github user                        

```