

class Game
  self = null


  constructor: ->
    self = this
    self.game = new Phaser.Game 640, 360, Phaser.AUTO, 'game', {preload: @preload, create: @create, update: @update, render: @render}

  preload: ->
    self.game.load.tilemap 'map', 'assets/tilemaps/csv/catastrophi_level2.csv', null, Phaser.Tilemap.CSV
    self.game.load.image 'tiles', 'assets/tilemaps/tiles/catastrophi_tiles_16.png'
    self.game.load.image 'fightbg', 'assets/bg/bg.png'
    self.game.load.image 'fightboss', 'assets/sprites/dragon.png'
    self.game.load.image 'fightmenu', 'assets/bg/menu2.png'
    self.game.load.spritesheet 'player', 'assets/sprites/artemis.png', 32, 32
    self.game.load.spritesheet 'button', 'assets/buttons/button_sprite_sheet.png', 193, 71
        
  
  create: ->
    self.game.scale.fullScreenScaleMode = Phaser.ScaleManager.SHOW_ALL

    self.game.state.add 'fightState', new FightState, true
    self.game.state.add 'creditsState', new CreditsState 
    self.game.state.add 'mapState', new MapState
       
    self.game.add.button self.game.world.Width - 100, 0, 'button', self.fullscreen, this, 2, 1, 0
   
  update: ->

  render: ->


  fullscreen: ->
    if self.game.scale.isFullScreen
      self.game.scale.stopFullScreen()
    else
      self.game.scale.startFullScreen false
    
window.onload = ()->
  new Game