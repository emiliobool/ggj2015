class Game extends Phaser.State

  constructor: ->
    game = new Phaser.Game 640, 360, Phaser.AUTO, 'game', this
    @assets_loaded = false
    @gfonts_loaded = false
  
  loadStart: ->
    @loadingText = @game.add.text @game.world.centerX, @game.world.centerY, 'Loading...', { fill: '#ffffff', align: 'center' }
    @loadingText.anchor.set 0.5

  loadComplete: ->
    @loadingText.setText("Load Complete");
    @assets_loaded = true
    
    if(@game.state.current == "default")
      @create()

  preload: ->
    @game.load.onLoadStart.add @loadStart, this
    #@game.load.onFileComplete.add @fileComplete, this
    @game.load.onLoadComplete.add @loadComplete, this
    @game.load.tilemap 'map', 'assets/tilemaps/csv/catastrophi_level2.csv', null, Phaser.Tilemap.CSV
    @game.load.image 'tiles', 'assets/tilemaps/tiles/catastrophi_tiles_16.png'
    @game.load.image 'fightbg', 'assets/bg/bg.png'
    @game.load.image 'fightboss', 'assets/sprites/dragon.png'
    @game.load.image 'fightmenu', 'assets/bg/menu2.png'
    @game.load.image 'fightmenu', 'assets/bg/menu2.png'
    @game.load.spritesheet 'player', 'assets/sprites/artemis.png', 32, 32
    @game.load.spritesheet 'button', 'assets/buttons/button_sprite_sheet.png', 193, 71

    @game.load.audio('menu_cursor', 'assets/audio/menu_cursor.wav');
    @game.load.audio('menu_disabled', 'assets/audio/menu_disabled.wav');
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
    if @assets_loaded && @gfonts_loaded
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