import java.math.BigInteger;

BigInteger kValue = new BigInteger("960939379918958884971672962127852754715004339660129306651505519271702802395266424689642842174350718121267153782770623355993237280874144307891325963941337723487857735749823926629715517173716995165232890538221612403238855866184013235585136048828693337902491454229288667081096184496091705183454067827731551705405381627380967602565625016981482083418783163849115590225610003652351370343874461848378737238198224849863465033159410054974700593138339226497249461751545728366702369745461014655997933798537483143786841806593422227898388722980000748404719");

void setup() {
  size(504,148);
  plot(kValue);
}

void plot(BigInteger k) {
  BigInteger bX, bY;
  scale(4);
  translate(10,10);
  background(210);
  stroke(0,0,255);
  bX = BigInteger.ZERO;
  for (int x = 0; x < 106; x++) {
    bY = k;
    for (long y = 0; y < 17; y++) {
      if (formula(bX, bY)) {
        point(106-x, y);
      }
      bY = bY.add(BigInteger.ONE);
    }
    bX = bX.add(BigInteger.ONE);
  }
}

boolean formula (BigInteger x, BigInteger y) {
  BigInteger _17 = new BigInteger("17");
  BigInteger _2 = new BigInteger("2");
  int p1 = x.multiply(_17).intValue();           // x * 17
  int p2 = y.mod(_17).intValue();                // y % 17
  BigInteger a = y.divide(_17);                  // y / 17
  BigInteger b = _2.pow(p1+p2);                  // 2^(x*17 + y%17)
  BigInteger result = a.divide(b);               // (y/17)/(2^(x*17+y%17)) == (y/17) * 2^(-x*17 - y%17)
  return result.mod(_2).equals(BigInteger.ONE);
}

//boolean formula (int x, int y) {
//  int a = y/17;
//  int p1 = -17*x;
//  int p2 = y%17;
//  float b = pow(2, p1-p2);
//  return 0.5 < int((a*b)%2);
//}
