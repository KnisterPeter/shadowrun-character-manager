package de.matrixweb.sr.charactermanager

import android.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.TextView

/**
 * @author markusw
 */
class CharacterDetailFragment extends Fragment {
  
  override onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    inflater.inflate(R.layout.activity_characterdetail, container, false)
  }
  
  override onActivityCreated(Bundle savedInstanceState) {
    super.onActivityCreated(savedInstanceState)
    
    val name = view.findViewById(R.id.characterdetail_name) as TextView
    name.text = 'Add character name here'
  }
  
}
