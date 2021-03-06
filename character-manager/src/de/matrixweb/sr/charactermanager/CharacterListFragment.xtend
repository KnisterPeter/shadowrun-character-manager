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
import java.util.List

/**
 * @author markusw
 */
class CharacterListFragment extends ListFragment {
  
  CharacterListSelectionListener selectionListener
  
  override onAttach(Activity activity) {
    super.onAttach(activity)
    if (activity instanceof CharacterListSelectionListener) {
      selectionListener = activity as CharacterListSelectionListener
    } else {
      throw new ClassCastException(activity + " must implement " + CharacterListSelectionListener.name)
    }
  }
  
  override onActivityCreated(Bundle savedInstanceState) {
    super.onActivityCreated(savedInstanceState)

    listAdapter = new CharacterListAdapter(activity, (activity as MainActivity).getCharacters())
    listView.onItemClickListener = [parent, view, position, id | selectionListener.onCharacterSelected(position) ]
  }
  
  override onDetach() {
    selectionListener = null
    super.onDetach()
  }
  
}

package class CharacterListAdapter extends ArrayAdapter<Character> {
  
  new(Activity context, List<Character> list) {
    super(context, R.layout.activity_characterlist_row, list)
  }
  
  override Activity getContext() {
    super.getContext() as Activity
  }

  override getView(int position, View convertView, ViewGroup parent) {
    var view = convertView
    if (view == null) {
      view = context.layoutInflater.inflate(R.layout.activity_characterlist_row, parent, false) => [ v |
        v.tag = new CharacterListRowViewHolder => [
          image = v.findViewById(R.id.characterlist_row_image) as ImageView
          name = v.findViewById(R.id.name) as TextView
          description = v.findViewById(R.id.description) as TextView
        ]
      ]
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

interface CharacterListSelectionListener {
  
  def void onCharacterSelected(int index)
  
}
