package de.matrixweb.sr.charactermanager

import android.app.Activity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import de.matrixweb.sr.lib.Character
import de.matrixweb.sr.lib.Human
import java.util.List

public class MainActivity extends Activity implements CharacterListSelectionListener {

  List<Character> characters

  protected override void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)
    if (savedInstanceState == null && R.id.fragment_parent.findViewById != null) openCharacterList()
  }

  override boolean onCreateOptionsMenu(Menu menu) {
    menuInflater.inflate(R.menu.main, menu)
    return true
  }

  override boolean onOptionsItemSelected(MenuItem item) {
    return super.onOptionsItemSelected(item)
  }
  
  override onCharacterSelected(int index) {
    openCharacterDetail(index)
  }
  
  private def openCharacterList() {
    val list = new CharacterListFragment()
    fragmentManager.beginTransaction().add(R.id.fragment_parent, list).commit()
  }
  
  private def openCharacterDetail(int index) {
    val detail = new CharacterDetailFragment
    detail.arguments = new Bundle => [ putInt('index', index) ]
    fragmentManager.beginTransaction().replace(R.id.fragment_parent, detail).addToBackStack(null).commit()
  }

  def getCharacterIndex(Character character) {
    characters.indexOf(character)
  }

  def getCharacters() {
    if (characters == null) {
      // TODO: Dummy...
      characters = newArrayList
      characters += createCharacter()
      characters += createCharacter()
      characters += createCharacter()
      characters += createCharacter()
      characters += createCharacter()
    }
    characters
  }

  // TODO: Dummy...
  private def createCharacter() {
    val character = new Character
    character.name = "Some 'Geek' Name"
    character.race = new Human
    character.description = 'Human Geek... Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.'
    return character
  }

}
