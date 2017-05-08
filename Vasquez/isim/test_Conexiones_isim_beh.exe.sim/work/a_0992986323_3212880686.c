/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/PaIsA/Google Drive/Semestres/Sistemas8/Arquitectura/SparV8/Vasquez/SEU.vhd";



static void work_a_0992986323_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(15, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (12 - 12);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(19, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2752);
    t9 = (t1 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 13U);
    xsi_driver_first_trans_delta(t1, 19U, 13U, 0LL);
    xsi_set_current_line(20, ng0);
    t1 = xsi_get_transient_memory(19U);
    memset(t1, 0, 19U);
    t2 = t1;
    memset(t2, (unsigned char)2, 19U);
    t9 = (t0 + 2752);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 19U);
    xsi_driver_first_trans_delta(t9, 0U, 19U, 0LL);

LAB3:    t1 = (t0 + 2672);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(16, ng0);
    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t9 = (t0 + 2752);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 13U);
    xsi_driver_first_trans_delta(t9, 19U, 13U, 0LL);
    xsi_set_current_line(17, ng0);
    t1 = xsi_get_transient_memory(19U);
    memset(t1, 0, 19U);
    t2 = t1;
    memset(t2, (unsigned char)3, 19U);
    t9 = (t0 + 2752);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 19U);
    xsi_driver_first_trans_delta(t9, 0U, 19U, 0LL);
    goto LAB3;

}


extern void work_a_0992986323_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0992986323_3212880686_p_0};
	xsi_register_didat("work_a_0992986323_3212880686", "isim/test_Conexiones_isim_beh.exe.sim/work/a_0992986323_3212880686.didat");
	xsi_register_executes(pe);
}
