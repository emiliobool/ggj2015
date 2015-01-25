class Game extends Phaser.State

  constructor: ->
    game = new Phaser.Game 640, 360, Phaser.AUTO, 'game', this
    @assets_loaded = false
    @gfonts_loaded = false
    window.fullscreen = () =>
      @fullscreen()

  loadStart: ->
    @loadingText = @game.add.text @game.world.centerX, @game.world.centerY, 'Loading...', { fill: '#ffffff', align: 'center' }
    @loadingText.anchor.set 0.5

  loadComplete: ->
    @loadingText.setText("Load Complete");
    @assets_loaded = true

    if @game.state.current == "default"
      @create()

  preload: ->
    @game.load.onLoadStart.add @loadStart, this
    @game.stage.disableVisibilityChange = true
    #@game.load.onFileComplete.add @fileComplete, this
    @game.load.onLoadComplete.add @loadComplete, this
    @game.load.tilemap 'map', 'assets/tilemaps/csv/map.csv', null, Phaser.Tilemap.CSV
   
    @game.load.image 'tiles', 'assets/tilemaps/tiles/Outside_A2.png'
    @game.load.image 'fightbg', 'assets/bg/bg.png'
    @game.load.image 'fightboss', 'assets/sprites/dragon.png'

    @game.load.image 'fightmenu', 'assets/bg/menu3.png'
    @game.load.image 'credits0', 'assets/credits/images/0.png'
    @game.load.image 'credits1', 'assets/credits/images/1.png'
    @game.load.image 'credits2', 'assets/credits/images/2.png'
    @game.load.image 'credits3', 'assets/credits/images/3.png'
    @game.load.image 'credits4', 'assets/credits/images/4.png'
    @game.load.image 'credits5', 'assets/credits/images/5.png'
    @game.load.image 'credits7', 'assets/credits/images/7.png'
  
    @game.load.text('creditstext', 'assets/credits/text/credits.txt');

    @game.load.spritesheet 'player', 'assets/sprites/characters.png', 32, 32
    @game.load.spritesheet 'button', 'assets/buttons/button_sprite_sheet.png', 193, 71

    @game.load.audio('menu_cursor', 'assets/audio/Blip_Select35.wav');
    @game.load.audio('menu_disabled', 'assets/audio/menu_disabled.wav');
    #@game.load.audio('credits_music', 'assets/audio/BoxCatGames-Rolling.mp3');
    @game.load.audio('credits_music', 'assets/audio/halaware.mp3');
    @game.load.audio('boss_death', 'assets/audio/Randomize25.wav');

    @game.load.script('filter', 'https://cdn.rawgit.com/photonstorm/phaser/master/filters/Fire.js');
    #@game.load.script 'webfont', '//ajax.googleapis.com/ajax/libs/webfont/1.5.10/webfont.js'
    #@game.load.start()

    @game.scale.fullScreenScaleMode = Phaser.ScaleManager.SHOW_ALL

    @game.state.add 'fightState', new FightState
    @game.state.add 'creditsState', new CreditsState
    @game.state.add 'mapState', new MapState

    WebFont.load(
      active: ()=>
        #console.log 'loaded', @game
        @gfonts_loaded = true
        @create()
        #@game.state.start 'fightState'
      google:
        families: ['VT323::latin']
    )

    

  create: ->

    if @assets_loaded && @gfonts_loaded && @game.state.current == "default"

      #@game.state.start 'fightState'
      @game.state.start 'fightState'



    #@game.add.button @game.world.Width - 100, 0, 'button', @fullscreen, this, 2, 1, 0

  update: ->

  render: ->


  fullscreen: ->
    
    if @game.scale.isFullScreen
      @game.scale.stopFullScreen()
    else
      @game.scale.startFullScreen false

window.onload = ()->
  new Game