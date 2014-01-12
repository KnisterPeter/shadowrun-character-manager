package de.matrixweb.sr.charactermanager

import android.app.Activity
import android.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.ViewGroup
import de.matrixweb.sr.charactermanager.ui.LabeledBox
import de.matrixweb.sr.charactermanager.ui.LabeledTextView
import de.matrixweb.sr.charactermanager.ui.TextButtonView
import de.matrixweb.sr.lib.Character
import de.matrixweb.sr.lib.Initiative

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
  
  LabeledBox attributeBox
  
  LabeledBox activeSkillBox
  
  override onAttach(Activity activity) {
    super.onAttach(activity)
    this.activity = activity as MainActivity
  }
  
  override onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    inflater.inflate(R.layout.activity_characterdetail, container, false) => [
      name = findViewById(R.id.name) as LabeledTextView
      race = findViewById(R.id.race) as LabeledTextView
      description = findViewById(R.id.description) as LabeledTextView
      gender = findViewById(R.id.gender) as LabeledTextView
      age = findViewById(R.id.age) as LabeledTextView
      karmapool = findViewById(R.id.karmapool) as LabeledTextView
      karma = findViewById(R.id.karma) as LabeledTextView
      reputation = findViewById(R.id.reputation) as LabeledTextView
      attributeBox = findViewById(R.id.attributeBox) as LabeledBox
      activeSkillBox = findViewById(R.id.activeSkillBox) as LabeledBox
    ]
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
      character.attributes.forEach[ attr |
        attributeBox.addView(new TextButtonView(activity) => [ v |
          v.name = attr.name
          switch attr {
            Initiative: {
              v.button = '''«character.reaction.modifiedLevel» + «attr.modifiedLevel»W6'''
            }
            default: {
              v.button = String.valueOf(attr.modifiedLevel)
            }
          }
        ])
      ]
      character.activeSkills.forEach[ skill |
        activeSkillBox.addView(new TextButtonView(activity) => [ v |
          v.name = skill.name
          v.button = String.valueOf(skill.level)
        ])
      ]
    }
  }
  
  override onSaveInstanceState(Bundle outState) {
    outState.putInt('index', activity.getCharacterIndex(character))
    super.onSaveInstanceState(outState)
  }
  
}
