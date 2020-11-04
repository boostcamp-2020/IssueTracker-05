import PropTypes from "prop-types";
import styled from "styled-components";
import { font, palette } from "styled-theme";

const fontSize = ({ height }) => `${height / 40}rem`;
const foregroundColor = ({  }) =>
  disabled ? palette("grayscale", 0, true) : palette("grayscale", 3, true);

const Label = styled.label`
  font-size: ${fontSize},
  padding: ${({ height }) => height * 0.8}px;
  margin: ${({ height }) => height * 1}px;
  color: ${}
`;
