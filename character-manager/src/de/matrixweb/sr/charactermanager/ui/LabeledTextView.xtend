package de.matrixweb.sr.charactermanager.ui

import android.widget.LinearLayout
import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import de.matrixweb.sr.charactermanager.R
import android.widget.TextView

/**
 * @author markusw
 */
class LabeledTextView extends LinearLayout {
  
  TextView value
  
  TextView label
  
  new(Context context) {
    super(context)
    init(context, null)
  }
  
  new(Context context, AttributeSet attrs) {
    super(context, attrs)
    init(context, attrs)
  }
  
  new(Context context, AttributeSet attrs, int defStyle) {
    super(context, attrs, defStyle)
    init(context, attrs)
  }
  
  private def init(Context context, AttributeSet attrs) {
    (context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater).inflate(R.layout.custom_labeled_textview, this, true)
    value = findViewById(R.id.value) as TextView
    label = findViewById(R.id.label) as TextView
    if (attrs != null) {
      val a = context.obtainStyledAttributes(attrs, R.styleable.LabeledTextView)
      setLabel(a.getString(R.styleable.LabeledTextView_value))
      label.text = a.getString(R.styleable.LabeledTextView_label)
    }

  }
  
  def getValue() {
    value.text
  }
  
  def void setValue(String value) {
    this.value.text = value ?: ''
  }
  
  def getLabel() {
    label.text
  }
  
  def void setLabel(String label) {
    this.label.text = label?.toUpperCase ?: ''
  }
  
}
