# Frecuency Analysis with FFT

## Audio Annalysis

### Why an Audio Visualizer?

My main purpose in building this was to learn more about ProcessingJS and Python as well as how the Fast Fourier Transform works.

However, using it in this project allowed me to literally visualize it which made it much easier to understand. I found that having a music visualizer also made it much easier for the class to understand when this project was presented.

### What is the Fast Fourier Transform?

Well, it's a faster version of the Fourier Transform! But for a real answer, a Fourier Transform is just a different way of looking at audio. Think about an MP3 looks when you play it on a computer -- you can see where the sound gets louder and quieter based on how large the waveforms are right?

Usually, we see music in the time domain, so we see how the audio changes over time. The Fourier Transform shows audio in the frequency domain instead -- that is, we instead see what frequencies are present in the song and their amplitudes (basically, how loud or soft they are).

So if there's a lot of heavy bass in the song, there will be a lot of lower frequencies shown in the graph. If a song has a lot of high-pitched guitar solos, graphing the song would show a lot more higher frequencies.

### Projects

#### Sound Analysis

To use, clone the repo and add an MP3 of your choice to the directory. Then go into `sound_analysis/main.js` and change `loadSound('song.mp3')` on line 4 to the path of your mp3.

You'll also need to run a local server to serve the mp3 -- I just used the command:

```sh
$ python2 -m SimpleHTTPServer 8000
```

##### How does this visualizer show that?

Luckily, using the P5JS library, we're given a sound library that does the hard work for us, so we can better understand how the visualizer shows a fourier transform.

Simply put, how the visualizer works is as the song plays, it is constantly running it through a fourier transform and plotting the output. So it basically takes the song in very very tiny chunks, analyzes it with the fourier transform, and then graphs the results.

### Audio Spectrum Analyzer

In this project you can see how the waveform of an audio received by microphone is represented graphically compared to the spectrum of the same. I use `scipy.fftpack` to compute the FFT and display the audio spectrum in real time using some python tools.

## Terrain Generation

### Projects

#### Terrain Generator

I create a 3D procedural terrain using **Perlin Noise** and the _beginShape()_ function in Processing.
