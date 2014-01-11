package de.matrixweb.sr.charactermanager

import android.app.Activity
import android.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import de.matrixweb.sr.lib.Character

/**
 * @author markusw
 */
class CharacterDetailFragment extends Fragment {
  
  MainActivity activity
  
  Character character
  
  TextView name
  
  Button body
  
  Button quickness
  
  Button strength
  
  Button charima
  
  Button intelligence
  
  Button willpower
  
  Button essence
  
  Button magic
  
  Button reaction
  
  Button initiative
  
  override onAttach(Activity activity) {
    super.onAttach(activity)
    this.activity = activity as MainActivity
  }
  
  override onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    val view = inflater.inflate(R.layout.activity_characterdetail, container, false)
    
    name = view.findViewById(R.id.characterdetail_name) as TextView
    body = view.findViewById(R.id.characterdetail_body_button) as Button
    quickness = view.findViewById(R.id.characterdetail_quickness_button) as Button
    strength = view.findViewById(R.id.characterdetail_strength_button) as Button
    charima = view.findViewById(R.id.characterdetail_charisma_button) as Button
    intelligence = view.findViewById(R.id.characterdetail_intelligence_button) as Button
    willpower = view.findViewById(R.id.characterdetail_willpower_button) as Button
    essence = view.findViewById(R.id.characterdetail_essence_button) as Button
    magic = view.findViewById(R.id.characterdetail_magic_button) as Button
    reaction = view.findViewById(R.id.characterdetail_reaction_button) as Button
    initiative = view.findViewById(R.id.characterdetail_initiative_button) as Button
    
    return view
  }
  
  override onViewStateRestored(Bundle savedInstanceState) {
    super.onViewStateRestored(savedInstanceState)
    updateUi(savedInstanceState ?: arguments)
  }
  
  private def updateUi(Bundle bundle) {
    if (bundle != null) 
      character = activity.characters.get(bundle.getInt('index'))
    if (character != null) {
      name.text = character.name
      body.text = String.valueOf(character.bodyValue)
      quickness.text = String.valueOf(character.quicknessValue)
      strength.text = String.valueOf(character.strengthValue)
      charima.text = String.valueOf(character.charismaValue)
      intelligence.text = String.valueOf(character.intelligenceValue)
      willpower.text = String.valueOf(character.willpowerValue)
      essence.text = String.valueOf(character.essenceValue)
      magic.text = String.valueOf(character.magicValue)
      reaction.text = String.valueOf(character.reactionValue)
      initiative.text = '''«character.reactionValue» + «character.initiative»W6'''
    }
  }
  
  override onSaveInstanceState(Bundle outState) {
    outState.putInt('index', activity.getCharacterIndex(character))
    super.onSaveInstanceState(outState)
  }
  
}
