
public class WordNoun extends Word{
  
 public WordNoun(String _w, String _pos) {
    super(_w, _pos);
 }

 public void render(int x, int y) {
    textFont(font, 18);
    fill(183,33,33);
    text(word, x, y);
 } 
  
}
