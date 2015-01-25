class CreditsState extends Phaser.State
  constructor: () ->
    @progress = 0
    @progress_events = []

  startMusic: ->
    @music.volume = 0.7
    @music.fadeIn(3000);

  create: ->
    creditsText = @game.cache.getText 'creditstext'
    @creditsSprite = @game.add.text 0, 0, creditsText, { font: '16px VT323', fill: '#FFFFFF'}
    @creditsSprite.y = @game.height
    @creditsSprite.x = 20

    @images_group = @game.add.group()
    
    @game.world.bringToTop(@creditsSprite)

    @music = @game.add.audio 'credits_music'
    @music.onDecoded.add @startMusic, this

    @runAtProgress -0.1, () =>
      credits_image = @images_group.create 243, 30, 'credits0'
      credits_image.alpha = 0
      #credits_image.tint = 0xffffff;
      #PIXI. SepiaFilter
      @game.add.tween(credits_image).to( { alpha:1 }, 10, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()
      
    @runAtProgress 0.014285714285714277, () =>
      credits_image = @images_group.create 243, 30, 'credits1'
      credits_image.alpha = 0
      
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.12857142857142856, () =>
      credits_image = @images_group.create 243, 30, 'credits2'
      credits_image.alpha = 0
      
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.24285714285714285, () =>
      credits_image = @images_group.create 243, 30, 'credits3'
      credits_image.alpha = 0
      
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.3571428571428571, () =>
      credits_image = @images_group.create 243, 30, 'credits4'
      credits_image.alpha = 0
      
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.4714285714285714, () =>
      credits_image = @images_group.create 243, 30, 'credits5'
      credits_image.alpha = 0
      
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.5857142857142857, () =>
      credits_image = @images_group.create 243, 30, 'credits6'
      credits_image.alpha = 0
      
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.7, () =>
      credits_image = @images_group.create 243, 30, 'credits7'
      credits_image.alpha = 0
      
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 1, () =>
      @game.state.start 'mapState'

  runAtProgress: (progress, callback) ->
    @progress_events.push [progress, true, callback]
  
  fireProgressEvents: ->
    for event in @progress_events
      if event[1] && event[0] <= @progress
        event[1] = false
        event[2]()

  update: ->
    @creditsSprite.y--
    @progress = 1 - (@creditsSprite.height + @creditsSprite.y) / @creditsSprite.height
    #console.log(@progress)
    @fireProgressEvents()

    