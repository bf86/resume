/*
  Actual tests coming "soon"
*/

import { render, screen } from '@testing-library/react';
import Header from '../component/Header';

test('renders headline', () => {
  render(<Header />);
  const headlineElement = screen.getByText(/Brian86/i);
  expect(headlineElement).toBeInTheDocument();
});
