import { TouchableOpacity, TouchableOpacityProps } from 'react-native';

interface ButtonProps extends TouchableOpacityProps {
  children: React.ReactNode;
}

export function Button({ children, style, ...props }: ButtonProps) {
  return (
    <TouchableOpacity style={style} {...props}>
      {children}
    </TouchableOpacity>
  );
} 