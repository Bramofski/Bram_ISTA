/*
*  Poetry generator program written by Ryan Bram and Nick Vogel
*  Text used and scrambled from "The Call of Cthulhu" by H.P. Lovecraft
*  Template used written by Agnus Forbes for ISTA 401
*/


import java.util.*;

List<Word> words;

PFont font = createFont("Handwriting - Dakota", 16);
PFont font2 = createFont("times", 16);
/*
ADJ:quick,brown,agile
NOUN:fox,dog,person
VERB:jump,bark
*/


void setup() {
  size(900,480); 
  
  Map<String, List<String>> wordMap = loadInWords("words.txt"); 
  
  /*
  for (String k : wordMap.keySet()) {
   // println("key = " + k); 
  
    List<String> values = wordMap.get(k);
  
    for (String v : values) {
     // println("\tvalue = " + v);
    }   
  }
  */
  
  words = parseGrammar(wordMap, "grammar.txt");
}


/*** 
  Loads in a text file indicating words assoicated with parts of speech, parses it, 
  and returns a Map of each part of speech and its assoicated List of words.
  Assumes each line looks like:

    POS:word1,word2,...,wordN
***/  
Map<String, List<String>> loadInWords(String filename) {
  
  Map<String, List<String>> m = new HashMap<String, List<String>>();
  
  String[] lines = loadStrings(filename);
  
  for (int i = 0 ; i < lines.length; i++) {
    //println(lines[i]);
    String[] chop = split(lines[i], ':');
    
    String POS = chop[0];
    String wordsStr = chop[1];
    //println("\tLEFT SIDE = " + POS);
    //println("\tRIGHT SIDE = " + wordsStr + "\n");
    
    String[] wordsArr = split(wordsStr, ','); //split right side into an array of Strings
    List<String> wordsList = Arrays.asList(wordsArr); //turns array into a List
   
    for (String tmpStr : wordsList) {
      //println("\t\tword="+tmpStr);
    }
    
    
    m.put(POS, wordsList);
  }
  
  return m;
}

List<Word> parseGrammar( Map<String, List<String>> m, String filename) {
  
  List<Word> ws = new ArrayList<Word>();
  // TO DO - 
  // 1. Load in Strings from "grammar.txt" and loop through each line.
  String[] lines = loadStrings(filename);
  
  
  for(String line : lines) {
    //println(line); 
    
    String[] posArr = line.split(" ");
    List<String> posList = Arrays.asList(posArr); //turns array into a List
    
    for (String p : posList) {
      //println("\t" + p);
      
      List<String> listOfWords = m.get(p);
      
      int randNum = (int) random(0,listOfWords.size());
       
      String randomWord = listOfWords.get( randNum );
      println("\t\t" + randomWord);
      
      Word w;
      if (p.equals("NOUN")) {
        w = new WordNoun(randomWord, p);
      } else {
        w = new Word(randomWord, p);
      }
      
      ws.add(w);
      
    }
  }
  
  return ws;
 }


float t = 0.0;

void draw() {
   background(247,249,255);
   stroke(234,24,98);
   line(40,0,40,480); 
   stroke(126,143,227);
   line(0,60,890,60);
   stroke(126,143,227);
   line(0,100,890,100);
   stroke(126,143,227);
   line(0,140,890,140);
   stroke(126,143,227);
   line(0,180,890,180);
   stroke(126,143,227);
   line(0,220,890,220);
   stroke(126,143,227);
   line(0,260,890,260);
   stroke(126,143,227);
   line(0,300,890,300);
   stroke(126,143,227);
   line(0,340,890,340);
   stroke(126,143,227);
   line(0,380,890,380);
   stroke(126,143,227);
   line(0,420,890,420);
   stroke(126,143,227);
   line(0,460,890,460);
   stroke(126,143,227);
   
   int pX = 80;
   int pY = 50;
   
   //for (Word w : words) {
   for (int i = 0; i < words.size(); i++) {
     Word w = words.get(i);
     
     if (millis() < i * 200) {
       continue;
     }
     
     w.render(pX, pY);
     
     int sw = (int)textWidth(w.word);
     pX += sw + 15;
     
     if (pX > width -70) {
       pX = 45;
       pY += 40;
     }
   }
}
  
