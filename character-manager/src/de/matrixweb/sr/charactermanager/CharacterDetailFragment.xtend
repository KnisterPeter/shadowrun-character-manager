package de.matrixweb.sr.charactermanager

import android.app.Activity
import android.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.Button
import de.matrixweb.sr.charactermanager.ui.LabeledTextView
import de.matrixweb.sr.lib.Character

/**
 * @author markusw
 */
class CharacterDetailFragment extends Fragment {
  
  MainActivity activity
  
  Character character
  
  LabeledTextView name
  
  LabeledTextView race
  
  LabeledTextView description
  
  LabeledTextView gender
  
  LabeledTextView age
  
  LabeledTextView karmapool
  
  LabeledTextView karma
  
  LabeledTextView reputation
  
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
    extension val view = inflater.inflate(R.layout.activity_characterdetail, container, false)
    
    name = findViewById(R.id.name) as LabeledTextView
    race = findViewById(R.id.race) as LabeledTextView
    description = findViewById(R.id.description) as LabeledTextView
    gender = findViewById(R.id.gender) as LabeledTextView
    age = findViewById(R.id.age) as LabeledTextView
    karmapool = findViewById(R.id.karmapool) as LabeledTextView
    karma = findViewById(R.id.karma) as LabeledTextView
    reputation = findViewById(R.id.reputation) as LabeledTextView
    body = findViewById(R.id.characterdetail_body_button) as Button
    quickness = findViewById(R.id.characterdetail_quickness_button) as Button
    strength = findViewById(R.id.characterdetail_strength_button) as Button
    charima = findViewById(R.id.characterdetail_charisma_button) as Button
    intelligence = findViewById(R.id.characterdetail_intelligence_button) as Button
    willpower = findViewById(R.id.characterdetail_willpower_button) as Button
    essence = findViewById(R.id.characterdetail_essence_button) as Button
    magic = findViewById(R.id.characterdetail_magic_button) as Button
    reaction = findViewById(R.id.characterdetail_reaction_button) as Button
    initiative = findViewById(R.id.characterdetail_initiative_button) as Button
    
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
      name.value = character.name
      race.value = character.race.name
      description.value = character.description
      gender.value = character.gender.name
      age.value = String.valueOf(character.age)
      karmapool.value = String.valueOf(character.karmapool)
      karma.value = String.valueOf(character.karma)
      reputation.value = String.valueOf(character.reputation)
      body.text = String.valueOf(character.bodyValue)
      quickness.text = String.valueOf(character.quicknessValue)
      strength.text = String.valueOf(character.strengthValue)
      charima.text = String.valueOf(character.charismaValue)
      intelligence.text = String.valueOf(character.intelligenceValue)
      willpower.text = String.valueOf(character.willpowerValue)
      essence.text = String.valueOf(character.essenceValue)
      magic.text = String.valueOf(character.magicValue)
      reaction.text = String.valueOf(character.reactionValue)
      initiative.text = '''«character.reactionValue» + «character.initiativeValue»W6'''
    }
  }
  
  override onSaveInstanceState(Bundle outState) {
    outState.putInt('index', activity.getCharacterIndex(character))
    super.onSaveInstanceState(outState)
  }
  
}
