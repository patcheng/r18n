# encoding: utf-8
=begin
I18n support for Windows.

Copyright (C) 2008 Andrey “A.I.” Sitnik <andrey@sitnik.ru>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end

# Win32API is deprecated as of 1.9.1
if RUBY_VERSION < '1.9'
  require 'dl/win32'
else
  require 'dl/import'
end

module R18n
  class I18n
    if RUBY_VERSION < '1.9'
      def self.system_locale
        id = Win32API.new('kernel32.dll', 'GetUserDefaultLangID', nil, 'i').call
        WIN32_LOCALES[id]
      end
    else
      module Kernel32
        extend DL::Importer
        dlload 'Kernel32'
        extern 'int GetUserDefaultLangID()'
      end
      
      def self.system_locale
        id = Kernel32.GetUserDefaultLangID()
        WIN32_LOCALES[id]
      end
    end
    
    WIN32_LOCALES = {
      0x0000 => 'en',
      0x007f => 'invariant',
      0x0400 => 'invalid',
      0x0800 => 'system',
      0x0436 => 'af_ZA',
      0x041c => 'sq_AL',
      0x0484 => 'gsw_FR',
      0x045e => 'am_ET',
      0x0401 => 'ar_SA',
      0x0801 => 'ar_IQ',
      0x0c01 => 'ar_EG',
      0x1001 => 'ar_LY',
      0x1401 => 'ar_DZ',
      0x1801 => 'ar_MA',
      0x1c01 => 'ar_TN',
      0x2001 => 'ar_OM',
      0x2401 => 'ar_YE',
      0x2801 => 'ar_SY',
      0x2c01 => 'ar_JO',
      0x3001 => 'ar_LB',
      0x3401 => 'ar_KW',
      0x3801 => 'ar_AE',
      0x3c01 => 'ar_BH',
      0x4001 => 'ar_QA',
      0x042b => 'hy_AM',
      0x044d => 'as_IN',
      0x042c => 'az_AZ-Latn',
      0x082c => 'az_AZ-Cyrl',
      0x046d => 'ba_RU',
      0x042d => 'eu_ES',
      0x0423 => 'be_BY',
      0x0445 => 'bn_IN',
      0x201a => 'bs_BA-Cyrl',
      0x141a => 'bs_BA-Latn',
      0x047e => 'br_FR',
      0x0402 => 'bg_BG',
      0x0455 => 'my_MM',
      0x0403 => 'ca_ES',
      0x0004 => 'zh_CHS',
      0x0404 => 'zh_TW',
      0x0804 => 'zh_CN',
      0x0c04 => 'zh_HK',
      0x1004 => 'zh_SG',
      0x1404 => 'zh_MO',
      0x7c04 => 'zh_CHT',
      0x0483 => 'co_FR',
      0x041a => 'hr_HR',
      0x101a => 'hr_BA',
      0x0405 => 'cs_CZ',
      0x0406 => 'da_DK',
      0x048c => 'gbz_AF',
      0x0465 => 'dv_MV',
      0x0413 => 'nl_NL',
      0x0813 => 'nl_BE',
      0x0409 => 'en_US',
      0x0809 => 'en_GB',
      0x0c09 => 'en_AU',
      0x1009 => 'en_CA',
      0x1409 => 'en_NZ',
      0x1809 => 'en_IE',
      0x1c09 => 'en_ZA',
      0x2009 => 'en_JA',
      0x2409 => 'en_CB',
      0x2809 => 'en_BZ',
      0x2c09 => 'en_TT',
      0x3009 => 'en_ZW',
      0x3409 => 'en_PH',
      0x4009 => 'en_IN',
      0x4409 => 'en_MY',
      0x4809 => 'en_SG',
      0x0425 => 'et_EE',
      0x0438 => 'fo_FO',
      0x464 => 'fil_PH',
      0x040b => 'fi_FI',
      0x040c => 'fr_FR',
      0x080c => 'fr_BE',
      0x0c0c => 'fr_CA',
      0x100c => 'fr_CH',
      0x140c => 'fr_LU',
      0x180c => 'fr_MC',
      0x0462 => 'fy_NL',
      0x0456 => 'gl_ES',
      0x0437 => 'ka_GE',
      0x0407 => 'de_DE',
      0x0807 => 'de_CH',
      0x0c07 => 'de_AT',
      0x1007 => 'de_LU',
      0x1407 => 'de_LI',
      0x0408 => 'el_GR',
      0x046f => 'kl_GL',
      0x0447 => 'gu_IN',
      0x0468 => 'ha_NG-Latn',
      0x040d => 'he_IL',
      0x0439 => 'hi_IN',
      0x040e => 'hu_HU',
      0x040f => 'is_IS',
      0x0421 => 'id_ID',
      0x045d => 'iu_CA-Cans',
      0x085d => 'iu_CA-Latn',
      0x083c => 'ga_IE',
      0x0434 => 'xh_ZA',
      0x0435 => 'zu_ZA',
      0x0410 => 'it_IT',
      0x0810 => 'it_CH',
      0x0411 => 'ja_JP',
      0x044b => 'kn_IN',
      0x043f => 'kk_KZ',
      0x0453 => 'kh_KH',
      0x0486 => 'qut_GT',
      0x0487 => 'rw_RW',
      0x0457 => 'kok_IN',
      0x0412 => 'ko_KR',
      0x0812 => 'ko_KR@win95',
      0x0440 => 'ky_KG',
      0x0454 => 'lo_LA',
      0x0426 => 'lv_LV',
      0x0427 => 'lt_LT',
      0x0827 => 'lt_LT@win98',
      0x082e => 'wee_DE',
      0x046e => 'lb_LU',
      0x042f => 'mk_MK',
      0x043e => 'ms_MY',
      0x083e => 'ms_BN',
      0x044c => 'ml_IN',
      0x043a => 'mt_MT',
      0x0481 => 'mi_NZ',
      0x047a => 'arn_CL',
      0x044e => 'mr_IN',
      0x047c => 'moh_CA',
      0x0450 => 'mn_MN',
      0x0850 => 'mn_CN',
      0x0461 => 'ne_NP',
      0x0414 => 'nb_NO',
      0x0814 => 'nn_NO',
      0x0482 => 'oc_FR',
      0x0448 => 'or_IN',
      0x0463 => 'ps_AF',
      0x0429 => 'fa_IR',
      0x0415 => 'pl_PL',
      0x0416 => 'pt_BR',
      0x0816 => 'pt_PT',
      0x0446 => 'pa_IN',
      0x046b => 'quz_BO',
      0x086b => 'quz_EC',
      0x0c6b => 'quz_PE',
      0x0418 => 'ro_RO',
      0x0417 => 'rm_CH',
      0x0419 => 'ru_RU',
      0x243b => 'smn_FI',
      0x103b => 'smj_NO',
      0x143b => 'smj_SE',
      0x043b => 'se_NO',
      0x083b => 'se_SE',
      0x0c3b => 'se_FI',
      0x203b => 'sms_FI',
      0x183b => 'sma_NO',
      0x1c3b => 'sma_SE',
      0x044f => 'sa_IN',
      0x0c1a => 'sr_SP-Cyrl',
      0x1c1a => 'sr_BA-Cyrl',
      0x081a => 'sr_SP-Latn',
      0x181a => 'sr_BA-Latn',
      0x046c => 'ns_ZA',
      0x0432 => 'tn_ZA',
      0x045b => 'si_LK',
      0x041b => 'sk_SK',
      0x0424 => 'sl_SI',
      0x040a => 'es_ES-ts',
      0x080a => 'es_MX',
      0x0c0a => 'es_ES',
      0x100a => 'es_GT',
      0x140a => 'es_CR',
      0x180a => 'es_PA',
      0x1c0a => 'es_DO',
      0x200a => 'es_VE',
      0x240a => 'es_CO',
      0x280a => 'es_PE',
      0x2c0a => 'es_AR',
      0x300a => 'es_EC',
      0x340a => 'es_CL',
      0x380a => 'es_UY',
      0x3c0a => 'es_PY',
      0x400a => 'es_BO',
      0x440a => 'es_SV',
      0x480a => 'es_HN',
      0x4c0a => 'es_NI',
      0x500a => 'es_PR',
      0x540a => 'es_US',
      0x0430 => 'sutu',
      0x0441 => 'sw_KE',
      0x041d => 'sv_SE',
      0x081d => 'sv_FI',
      0x045a => 'syr_SY',
      0x0428 => 'tg_TJ-Cyrl',
      0x085f => 'ber_DZ',
      0x0449 => 'ta_IN',
      0x0444 => 'tt_RU',
      0x044a => 'te_IN',
      0x041e => 'th_TH',
      0x0451 => 'bo_CN',
      0x0851 => 'bo_BT',
      0x041f => 'tr_TR',
      0x0442 => 'tk_TM',
      0x0480 => 'ug_CN',
      0x0422 => 'uk_UA',
      0x042e => 'wen_DE',
      0x0420 => 'ur_PK',
      0x0820 => 'tr_IN',
      0x0443 => 'uz_UZ-Latn',
      0x0843 => 'uz_UZ-Cyrl',
      0x042a => 'vi_VN',
      0x0452 => 'cy_GB',
      0x0488 => 'wo_SN',
      0x0485 => 'sah_RU',
      0x0478 => 'ii_CN',
      0x046a => 'yo_NG',
    } 
  end
end
