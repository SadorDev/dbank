import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 232359984589984;
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

// Allow users to withdraw an amount from the cuurent value
  public func withDraw(amount: Float){
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too much, current value has to be less than 0")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  // topUp();

  public func compound() {
    // How the number of seconds have elapsed 
    let currentTime = Time.now();
    // How many nano seconds have elapsed 
    let timeElapsedNS = currentTime - startTime;
    // Change time to seconds
    let timeElapsedS = timeElapsedNS / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }

}