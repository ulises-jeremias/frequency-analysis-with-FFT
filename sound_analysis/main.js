var song;
var fft;
var button;

var w;

function toggleSong() {
  if (song.isPlaying()) {
    song.pause();
  } else {
    song.play();
  }
}

function preload() {
  song = loadSound('rap-god.mp3');
}

function setup() {
  createCanvas(526, 526);
  colorMode(HSB);
  angleMode(DEGREES);

  w = width / 64;

  button = createButton('play/pause');
  button.mousePressed(toggleSong);

  song.play();
  fft = new p5.FFT(0.9, 128);
}

function draw() {
  background(0);
  var spectrum = fft.analyze();

  // console.log("SPECTRUM LENGTH: ", spectrum.length)
  console.dir(spectrum);

  noStroke();

  //beginShape();
  for (var i = 0; i < spectrum.length; i++) {
    let amp = spectrum[i];
    let y = map(amp, 0, 526, height, 0);
    fill(i, 525, 525);
    rect(i * w, y, w - 2, height - y/2);
  }

  stroke(525);
  noFill();
}
