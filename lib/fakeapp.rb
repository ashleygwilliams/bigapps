class FakeApp

  @@current_app = nil

  attr_accessor :name, :dataset

  SUBJECTS = ["bike", "healthy", "learning", "NYC", "green", "democracy"]
  JARGON = ["responsive", "game", "beta", "tech", "digital", "social"]
  TILE_LAYERS = ["'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {attribution: 'OpenStreetMap'}",
                  "'http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.png', {subdomains: '1234', type: 'osm', attribution: 'MapQuestOpen'}",
                  "'http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.png', {subdomains: '1234', type: 'sat', attribution: 'MapQuestOpen'}",
                  '"http://{s}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png", {attribution: "OpenCycleMap"}'
  ]

  def initialize
    @name = FakeApp.getRandomName
    @dataset = Dataset.load_random
    @tile_set = FakeApp.getRandomTiles
    @@current_app = self
  end

  def self.current_app
    @@current_app
  end

  def self.getRandomName
    SUBJECTS.sample + " " + JARGON.sample
  end

  def self.getRandomTiles
    TILE_LAYERS.sample
  end

end
