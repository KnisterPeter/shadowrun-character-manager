package de.matrixweb.sr.lib

import java.util.Random

/**
 * @author markusw
 */
class Dice {
  
  static Random rnd = new Random(System.currentTimeMillis)
  
  /**
   * Roll <em>n</em> dice and add the results. The rule of the 6 does not apply here.
   * E.g. use this for initiative in combat
   */
  static def rollSum(int n) {
    (0 ..< n).map[rnd.nextInt(6) + 1].reduce[d1, d2| d1 + d2]
  }
  
  /**
   * This is the default dice roll. It rolls <em>n</em> dice. The rule of the
   * six is applied and the results are returned.
   */
  static def roll(int n) {
    (0 ..< n).map[rollSixUp()]
  }
  
  private static def rollSixUp() {
    var res = 0
    var next = rnd.nextInt(6) + 1
    while (next == 6) {
      res = res + next
      next = rnd.nextInt(6) + 1
    }
    res = res + next
    return res
  }
  
}
