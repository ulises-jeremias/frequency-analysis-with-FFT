import peasy.*;

PeasyCam cam;

float flatrate = 1;
float scl = 5;
float hue = 0;

int sat = 255;
int sat1 = 255;
int br1 = 255;

void setup() {
    cam = new PeasyCam(this, 0, 0, 0, 1000);
    size(800, 800, P3D);
    translate(width/2, height/2);
}

void draw() {
    background(0);
    lights();
    float r;
    float r2;
    float pidiv = 120;
    float minrad = 1500;
    float maxrad = 2000;
    colorMode(HSB);
    
    for (float a = 0; a < PI; a += PI/pidiv) {

        beginShape(TRIANGLE_STRIP);
        for (float b = 0; b < TWO_PI; b += PI/pidiv) {
            r = map(noise(scl*cos(b)*cos(a) + minrad, scl*cos(b)*sin(a) + minrad, scl*flatrate*sin(b) + minrad), 0, 1, minrad, maxrad);
            r2 = map(noise(scl*cos(b)*cos(a + PI/pidiv) + minrad, scl*cos(b)*sin(a + PI/pidiv) + minrad, scl*flatrate*sin(b) + minrad), 0, 1, minrad, maxrad);
            // r = r2 = minrad;
            
            hue = map(r, minrad, maxrad, 0, 360);
            
            // stroke(hue, sat, 255);
            // fill(hue, sat1, br1);
            strokeWeight(1);
            vertex(r*cos(b)*cos(a), -r*cos(b)*sin(a), flatrate*r*sin(b));
            vertex(r2*cos(b)*cos(a + PI/pidiv), -r2*cos(b)*sin(a + PI/pidiv), flatrate*r2*sin(b));
        }
        endShape(CLOSE);
    }
}

public void keyPressed() {
    if (key == 'w') {
        flatrate += 0.02;
    } else if (key == 's') {
        flatrate -= 0.02;
    } else if (key == 'd') {
        scl++;
    } else if (key == 'a') {
        scl--;
    } else if (key == 'f') {
        sat = 0;
    } else if (key == 'g') {
        sat = 255;
    } else if (key == 'b') {
        sat1 = 0;
        br1 = 0;
    } else if (key == 'n') {
        sat1 = 255;
        br1 = 255;
    }
}
