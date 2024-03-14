// Copyright 2024 xalanq <xalanq@gmail.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
// implied. See the License for the specific language governing
// permissions and limitations under the License. See the AUTHORS file
// for names of contributors.

// Assembly to mimic runtime.getg.

//go:build riscv64
// +build riscv64

#include "go_asm.h"
#include "textflag.h"

// func getPid() int64
TEXT ·getPid(SB), NOSPLIT, $0-8
	MOV	g, T0
	MOV	g_m(T0), T1
	MOV	m_p(T1), T0
	MOV	p_id(T0), T1
	MOV	T1, ret+0(FP)
	RET
