package com.sharp.parts.settings

import android.content.Context
import android.os.Bundle
import android.util.Log
import androidx.preference.Preference
import androidx.preference.Preference.OnPreferenceChangeListener
import androidx.preference.PreferenceFragment
import androidx.preference.SwitchPreference

import com.sharp.parts.R

class ShSettingsFragment : PreferenceFragment() {
    private var mShtpshrPreference: SwitchPreference? = null
    private var mShtpsglovePreference: SwitchPreference? = null
    private var mShdispPreference: SwitchPreference? = null

    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        addPreferencesFromResource(R.xml.sharp_settings)
        mShtpshrPreference = findPreference(ShUtils.SHTPS_HR_KEY) as SwitchPreference?
        mShtpsglovePreference = findPreference(ShUtils.SHTPS_GL_KEY) as SwitchPreference?
        mShdispPreference = findPreference(ShUtils.SHDISP_KEY) as SwitchPreference?

        mShtpshrPreference?.apply {
            isEnabled = true
            setOnPreferenceChangeListener { preference, any ->
                if (ShUtils.SHTPS_HR_KEY.equals(preference.key)) {
                    ShUtils.setShtpshrStatus(if (any as Boolean) ShUtils.SHTPS_ON else ShUtils.SHTPS_OFF)
                }
                true
            }
        }

        mShtpsglovePreference?.apply {
            isEnabled = true
            setOnPreferenceChangeListener { preference, any ->
                if (ShUtils.SHTPS_GL_KEY.equals(preference.key)) {
                    ShUtils.setShtpsglStatus(if (any as Boolean) ShUtils.SHTPS_ON else ShUtils.SHTPS_OFF)
                }
                true
            }
        }

        mShdispPreference?.apply {
            isEnabled = true
            setOnPreferenceChangeListener { preference, any ->
                if (ShUtils.SHDISP_KEY.equals(preference.key)) {
                    ShUtils.setShdispStatus(if (any as Boolean) ShUtils.SHTPS_ON else ShUtils.SHTPS_OFF)
                }
                true
            }
        }
    }

    companion object {
        private const val TAG = "ShSettingsFragment"
    }
}