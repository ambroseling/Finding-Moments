import { Image, StyleSheet, Platform } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';

import ParallaxScrollView from '@/components/ParallaxScrollView';
import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';

export default function HomeScreen() {
  return (
    <ParallaxScrollView
      headerBackgroundColor={{ light: '#4A90E2', dark: '#2C3E50' }}
      headerImage={
        <LinearGradient
          colors={['rgba(74, 144, 226, 0.9)', 'rgba(74, 144, 226, 0.7)']}
          style={styles.headerGradient}>
          <Image
            source={require('@/assets/images/dreamy-moment.jpg')}
            style={styles.headerImage}
          />
        </LinearGradient>
      }>
      <ThemedView style={styles.container}>
        <ThemedView style={styles.welcomeSection}>
          <ThemedText type="title" style={styles.mainTitle}>
            Finding Moments
          </ThemedText>
          <ThemedText style={styles.subtitle}>
            Capture and share your precious memories
          </ThemedText>
        </ThemedView>

        <ThemedView style={styles.featuresContainer}>
          <FeatureCard
            title="Create Stories"
            description="Share your daily moments with beautiful stories"
            icon="📸"
          />
          <FeatureCard
            title="Connect"
            description="Follow friends and family to stay updated"
            icon="👥"
          />
          <FeatureCard
            title="Discover"
            description="Explore trending moments around you"
            icon="🌎"
          />
        </ThemedView>
      </ThemedView>
    </ParallaxScrollView>
  );
}

function FeatureCard({ title, description, icon }: { title: string; description: string; icon: string }) {
  return (
    <ThemedView style={styles.card}>
      <ThemedText style={styles.cardIcon}>{icon}</ThemedText>
      <ThemedText type="subtitle" style={styles.cardTitle}>
        {title}
      </ThemedText>
      <ThemedText style={styles.cardDescription}>
        {description}
      </ThemedText>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 16,
  },
  headerGradient: {
    height: '100%',
    width: '100%',
  },
  welcomeSection: {
    alignItems: 'center',
    marginVertical: 24,
  },
  mainTitle: {
    fontSize: 32,
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 16,
    opacity: 0.8,
    textAlign: 'center',
  },
  featuresContainer: {
    gap: 16,
  },
  card: {
    padding: 20,
    borderRadius: 12,
    backgroundColor: Platform.select({
      ios: 'rgba(255, 255, 255, 0.1)',
      android: 'rgba(255, 255, 255, 0.1)',
      web: 'rgba(255, 255, 255, 0.1)',
    }),
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 3,
  },
  cardIcon: {
    fontSize: 32,
    marginBottom: 12,
  },
  cardTitle: {
    marginBottom: 8,
  },
  cardDescription: {
    opacity: 0.8,
  },
  // reactLogo: {
  //   height: 178,
  //   width: 290,
  //   bottom: 0,
  //   left: 0,
  //   position: 'absolute',
  // },
  headerImage: {
    width: '100%',
    height: '100%',
    resizeMode: 'cover',
    position: 'absolute',
    zIndex: -1,
  },
});