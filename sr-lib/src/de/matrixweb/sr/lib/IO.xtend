package de.matrixweb.sr.lib

import com.fasterxml.jackson.databind.ObjectMapper

/**
 * @author markusw
 */
class IO {
  
  static extension ObjectMapper om = new ObjectMapper()
  
  static def write(Character character) {
    character.writeValueAsString()
  }
  
  static def read(String character) {
    character.readValue(Character)
  }
  
}
