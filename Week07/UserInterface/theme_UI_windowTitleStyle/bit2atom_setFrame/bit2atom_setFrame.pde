PImage iconImage;

String[] name = {":: gridCircle Generative Design Tool 2020.01 :: 设计管理研究所"};//title string

void setup() {
  size(1600, 800);
  iconImage = loadImage("icon-32.png");
  surface.setTitle(name[0]);//title string
  surface.setIcon(iconImage);
  surface.setResizable(true);
}

void draw(){
  background(0);
}

/**
import java.awt.Frame;

protected void setProcessingIcon(Frame frame)
  {
    if (PApplet.platform != 2)
    {
      try
      {
        if (this.iconImages == null) {
          this.iconImages = new ArrayList();
          int[] sizes = { 16, 32, 48, 64, 128, 256, 512 };

          for (int sz : sizes)
          {
            URL url = PApplet.class.getResource("/icon/icon-" + sz + ".png");
            Image image = Toolkit.getDefaultToolkit().getImage(url);
            this.iconImages.add(image);
          }
        }

        frame.setIconImages(this.iconImages);
      }
      catch (Exception localException1) {
      }
    }
    else if (!dockIconSpecified())
    {
      URL url = PApplet.class.getResource("/icon/icon-512.png");
      try
      {
        Class thinkDifferent = 
          Thread.currentThread().getContextClassLoader().loadClass("processing.core.ThinkDifferent");
        Method method = 
          thinkDifferent.getMethod("setIconImage", new Class[] { Image.class });
        method.invoke(null, new Object[] { Toolkit.getDefaultToolkit().getImage(url) });
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
*/
