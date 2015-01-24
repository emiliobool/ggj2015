

class Game
  self = null


  constructor: ->
    self = this
    self.game = new Phaser.Game 640, 360, Phaser.AUTO, 'game', {preload: @preload, create: @create, update: @update, render: @render}

  preload: ->
    self.game.load.tilemap 'map', 'assets/tilemaps/csv/catastrophi_level2.csv', null, Phaser.Tilemap.CSV
    self.game.load.image 'tiles', 'assets/tilemaps/tiles/catastrophi_tiles_16.png'
    self.game.load.image 'fightbg', 'assets/bg/FFIV_PSP_Mountain_Battle.png'
    self.game.load.image 'fightmenu', 'assets/bg/menu2.png'
    self.game.load.spritesheet 'player', 'assets/sprites/artemis.png', 32, 32
    self.game.load.spritesheet 'button', 'assets/buttons/button_sprite_sheet.png', 193, 71
        
  
  create: ->
    self.game.scale.fullScreenScaleMode = Phaser.ScaleManager.SHOW_ALL
    button = self.game.add.button self.game.world.Width - 100, 0, 'button', self.fullscreen, this, 2, 1, 0
    self.scene_fight()
   
    

  scene_map: ->
    self.map = new Map self.game
  scene_fight: ->
    self.fight = new Fight self.game
  scene_credits: ->
    self.credits = new Credits self.game
  update: ->
    if self.map
      self.map.update()
    if self.fight
      self.fight.update()
    if self.credits
      self.credits.update()
    #self.createText(10, 10)

  render: ->


  fullscreen: ->
    if self.game.scale.isFullScreen
      self.game.scale.stopFullScreen()
    else
      self.game.scale.startFullScreen false
    
window.onload = ()->
  new Game