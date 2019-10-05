<h1 align="center">
Godot Presentations 2.0</br>
<small>Build beautiful and gamified presentations in Godot</small>
</h1>

<p align='center'>
  <img src="https://i.imgur.com/bm30rQI.png" alt="Godot Slides logo" />
</p>

Godot Presentations is a tool to create elegant slideshows with the Godot game engine, using drag-and-drop UI widget.

We used it to create the [Godot Power Pitch](https://github.com/GDquest/godot-power-pitch), an open source slideshow to pitch the engine at game developer meetups and events.

## Features

As the presentation system runs inside of Godot, you can:

- Run **games inside your slides**
- **Translate your presentations** easily and change the slides' language on the fly
- **Animate anything** with the animation editor or tweens, add particles and sounds

## How to use

The presentation system is in the `src/` directory. You have a `content` directory where you can save your presentation, slides, demos, etc.

To create a new presentation:

1. Create a new inherited scene that extends `Presentation.tscn`
1. Create individual Slide scenes and add them as children of the `Slides` node in the `Presentation` scene

That's it! the presentation runs the slides in the scene tree’s order.

### How to create slides

In the `src/Slide` directory, you have a `Template` folder that contains the GDQuest slides. You can create an inherited scene from them to create slides fast.

You can also create custom slides. The only requirement is to extend the `Slide.tscn` scene, or have a similar setup.

You have reusable UI components you can use to design your slides in the `Slide/Layout` and `Slide/Widgets` directories. Drag and drop them in your slides until you get the template you want.

