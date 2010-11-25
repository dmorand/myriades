package myriades.util

import java.net._

trait ResourceLocator {
  def getResourceLocation(name: String) : URL = {
      val qualifiedName = getClass.getPackage.getName.replace('.', '/') + "/" + name
      getClass.getClassLoader.getResource(qualifiedName)
  }
}