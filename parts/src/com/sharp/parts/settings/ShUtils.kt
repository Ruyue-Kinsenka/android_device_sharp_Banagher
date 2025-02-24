package com.sharp.parts.settings

import android.os.SystemProperties
import android.util.Log

class ShUtils {
    companion object {
        private const val TAG = "ShUtils"
        const val SHTPS_HR_KEY = "shtps_hr_key"
        const val SHTPS_HR_PROP = "persist.sharp.high_report"
        const val SHTPS_GL_KEY = "shtps_glove_key"
        const val SHTPS_GL_PROP = "persist.sharp.glove.mode"
        const val SHDISP_KEY = "shdisp_key"
        const val SHDISP_PROP = "persist.sharp.displayrate"
        const val SHTPS_ON = "1"
        const val SHTPS_OFF = "0"
        const val SHTPS_NOT_SUPPORT = "-1"

        fun getShtpshrStatus(): String {
            SystemProperties.get(SHTPS_HR_PROP).apply {
                if (equals(SHTPS_ON) || equals(SHTPS_OFF)) {
                    return this
                } else {
                    Log.e(TAG, "SHTPS NOT SUPPORT")
                }
            }
            return SHTPS_NOT_SUPPORT
        }

        fun getShtpsglStatus(): String {
            SystemProperties.get(SHTPS_GL_PROP).apply {
                if (equals(SHTPS_ON) || equals(SHTPS_OFF)) {
                    return this
                } else {
                    Log.e(TAG, "SHTPS NOT SUPPORT")
                }
            }
            return SHTPS_NOT_SUPPORT
        }

        fun getShdispStatus(): String {
            SystemProperties.get(SHDISP_PROP).apply {
                if (equals(SHTPS_ON) || equals(SHTPS_ON)) {
                    return this
                } else {
                    Log.e(TAG, "SHDISP NOT SUPPORT")
                }
            }
            return SHTPS_NOT_SUPPORT
        }

        fun setShtpsglStatus(status: String) {
            SystemProperties.set(SHTPS_GL_PROP, status)
        }

        fun setShtpshrStatus(status: String) {
            SystemProperties.set(SHTPS_HR_PROP, status)
        }

        fun setShdispStatus(status: String) {
            SystemProperties.set(SHDISP_PROP, status)
        }
    }
}
