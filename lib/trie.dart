final int asize=26;

trieNode root=trieNode();

String refine(s){
  s=s.replaceAll(' ',"");
  s=s.replaceAll(new RegExp(r'[^\w\s]+'),'');
  s=s.replaceAll("2","");
//  print(s);
  return s.toLowerCase();
//  return "";
}

class trieNode{
  bool end=false;
  List<trieNode> children=new List<trieNode>(asize);
}


void insert(String name){
  int length=name.length;
  trieNode crawl=root;//initially start to crawl from the root

  for(int height=0;height<length;height++){
    int index=name.codeUnitAt(height)-'a'.codeUnitAt(0);
//  print(name[height]+" " +index.toString());
    if(crawl.children[index]==null){//If Letter does Not match
      crawl.children[index]=trieNode();
    }
    crawl=crawl.children[index];

  }
  crawl.end=true;//Here the word Completes
}

//Auto Suggestion Start
List autoSuggestion(String name){
  trieNode crawl=root;
//   Case check if the given prefix is atleast existing
  try{
    int length=name.length;
    for(int height=0;height<length;height++){
      int index=name.codeUnitAt(height)-'a'.codeUnitAt(0);

      if(crawl.children==null)
        return [];//Prefix Not present
//    print(crawl.children)
      crawl=crawl.children[index];
    }

//   elsewise the prefix is present till here

    var ls=autoSuggestionGetNames(crawl,name,[]);
//    print(ls);
    return ls;
  }
  catch(e){
    return [];
  }
}

List autoSuggestionGetNames(trieNode crawl,String name,ls){
//   Case if this current word is already Complete
  try{
    if(crawl.end==true){
//      print('$name');//We get the word here
      ls.add(name);
       }
  }
  catch(e){
//    print(e);
  }

  for(int index=0;index<asize;index++){
//     If we see a possibility in any index
    try{
      if(crawl.children[index]!=null){
        autoSuggestionGetNames(crawl.children[index],name+String.fromCharCode(index+'a'.codeUnitAt(0)),ls);

      }
    }
    catch(e){
//      print(e);
    }
  }
  return ls;
}