import mqtt.*;

class MQTTReceiver implements MQTTListener {
  final static String POTI_RIGHT_ACCESSOR = "a0";
  final static String POTI_LEFT_ACCESSOR = "a1";
  private MQTTClient client;
  private int potiX;
  private int potiY;
  private boolean debug = false;
  private Avarage avX;
  private Avarage avY;
  
  MQTTReceiver(PApplet p, boolean debug) {
    this.debug = debug;
    this.avX = new Avarage();
    this.avY = new Avarage();
    if (this.debug) {
     this.avX.max = width;
     this.avY.max = height;
    }
    if (!this.debug) {
      this.client = new MQTTClient(p, this);
      this.client.connect("mqtt://localhost", "processing");
    }
  }
  
  void clientConnected() {
    println("client connected, subscribing to values.");
    this.client.subscribe(MQTTReceiver.POTI_RIGHT_ACCESSOR);
    this.client.subscribe(MQTTReceiver.POTI_LEFT_ACCESSOR);
    println("subscription done.");
  }

  void messageReceived(String topic, byte[] payload) {
    if(topic.equals(MQTTReceiver.POTI_RIGHT_ACCESSOR)) {
      this.potiX = Integer.parseInt(new String(payload));
    } else if(topic.equals(MQTTReceiver.POTI_LEFT_ACCESSOR)){
      this.potiY = Integer.parseInt(new String(payload));
    }
  }
  
  void connectionLost() {
    println("connection lost");
  }
  
  public PVector values() {
    if (this.debug) return new PVector(mouseX, mouseY);
    return new PVector(this.potiX, this.potiY);
  }
  
  public PVector average() {
    PVector p = this.values();
    avX.update(p.x);
    avY.update(p.y);
    return new PVector(avX.value(),avY.value());
  }
  
  public PVector averageMapped() {
    PVector a = this.average();
    float x = map(a.x, avX.min, avX.max, 0, width);
    float y = map(a.y, avY.min, avY.max, 0, height);
    return new PVector(x, y);
  }
}
