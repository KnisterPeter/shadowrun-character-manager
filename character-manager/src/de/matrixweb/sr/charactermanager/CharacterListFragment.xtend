package de.matrixweb.sr.charactermanager

import android.app.Activity
import android.app.ListFragment
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.ImageView
import android.widget.TextView
import de.matrixweb.sr.lib.Character
import de.matrixweb.sr.lib.Human
import java.util.List

/**
 * @author markusw
 */
class CharacterListFragment extends ListFragment {
  
  override onActivityCreated(Bundle savedInstanceState) {
    super.onActivityCreated(savedInstanceState)
    
    // TODO: Load real data
    val chars = newArrayList
    chars += getCharacter()
    chars += getCharacter()
    chars += getCharacter()
    chars += getCharacter()
    
    listAdapter = new CharacterListAdapter(activity, chars)
    listView.onItemClickListener = [parent, view, position, id |
      val cdf = new CharacterDetailFragment
      cdf.arguments = new Bundle
      cdf.arguments.putString(Constants.CHARACTER_NAME_KEY, chars.get(position).name)
      fragmentManager.beginTransaction().replace(R.id.fragment_parent, cdf).addToBackStack(null).commit()
    ]
  }
  
  // TODO: Dummy...
  private def getCharacter() {
    val character = new Character
    character.name = "Some 'Geek' Name"
    character.race = new Human
    character.description = 'Human Geek... Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.'
    return character
  }
  
}

package class CharacterListAdapter extends ArrayAdapter<Character> {
  
  new(Activity context, List<Character> list) {
    super(context, R.layout.activity_characterlist_row, list)
  }
  
  override getView(int position, View convertView, ViewGroup parent) {
    var view = convertView
    if (view == null) {
      view = (context as Activity).layoutInflater.inflate(R.layout.activity_characterlist_row, parent, false)
      val holder = new CharacterListRowViewHolder
      holder.image = view.findViewById(R.id.characterlist_row_image) as ImageView
      holder.name = view.findViewById(R.id.characterlist_row_name) as TextView
      holder.description = view.findViewById(R.id.characterlist_row_description) as TextView
      view.tag = holder
    }
    
    val holder = view.tag as CharacterListRowViewHolder
    
    val character = position.item
    holder.name.text = '''«character.name» («character.race.name»)'''
    holder.description.text = character.description
    
    return view
  }
  
}
package class CharacterListRowViewHolder {
    @Property
    ImageView image
    @Property
    TextView name
    @Property
    TextView description
}
