public class Star{
  private int x,y;
  public Star(){
    x = rand(0,width);
    y = rand(0, height);
  }
  public void setV(int xp, int yp){
    x = xp;
    y = yp;
  }
  public void show(){
    fill(255,255,255);
    rect(x,y,1,1);
    noFill();
  }
  public int getX(){return x;}
  public int getY(){return y;}
}
