package org.mirah.jvm.types

import org.jruby.org.objectweb.asm.Opcodes
import org.jruby.org.objectweb.asm.Type

class JVMTypeUtils
  class << self
    def isPrimitive(type:JVMType)
      sort = type.getAsmType.getSort
      sort != Type.OBJECT && sort != Type.ARRAY
    end

    def isEnum(type:JVMType):boolean
      0 != (type.flags & Opcodes.ACC_ENUM)
    end

    def isInterface(type:JVMType):boolean
      0 != (type.flags & Opcodes.ACC_INTERFACE)
    end

    def isAbstract(type:JVMType):boolean
      0 != (type.flags & Opcodes.ACC_ABSTRACT)
    end

    def isAnnotation(type:JVMType):boolean
      0 != (type.flags & Opcodes.ACC_ANNOTATION)
    end

    def isArray(type:JVMType):boolean
      type.getAsmType.getSort == Type.ARRAY
    end
  end
end