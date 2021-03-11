class Avarage {
  private float sum = 0;
  private float[] storedValues;
  private int count = 0;
  public float min = MAX_FLOAT;
  public float max = 0;
  
  Avarage() {
   this.storedValues = new float[25];
  }
  
  void update(float value) {
    if (value > max) max = value;
    if (value < min) min = value;
    if(this.count < this.storedValues.length) {
      this.storedValues[count++] = value;
      this.sum += value;
    } else {
      this.sum += value;
      this.sum -= this.storedValues[0];
      for(int i = 0; i < this.storedValues.length-1; i++) {
         this.storedValues[i] = this.storedValues[i+1];
      }
      this.storedValues[this.storedValues.length-1] = value;
    }
  }
  
  float value() {
    return this.sum / this.count;
  }
    
}
